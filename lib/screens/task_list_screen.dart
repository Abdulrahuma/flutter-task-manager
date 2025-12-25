import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/api_service.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late Future<List<Task>> tasks;

  @override
  void initState() {
    super.initState();
    tasks = ApiService.fetchTasks();
  }

  // 🔹 Add Task Dialog
  void showAddTaskDialog() {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Enter task title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (controller.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a task name'),
                    ),
                  );
                  return;
                }

                // API call (mock)
                await ApiService.addTask(controller.text);

                // Update UI locally
                setState(() {
                  tasks = tasks.then((list) {
                    return [
                      Task(
                        id: list.length + 1,
                        title: controller.text,
                        completed: false,
                      ),
                      ...list,
                    ];
                  });
                });

                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: showAddTaskDialog,
        child: const Icon(Icons.add),
      ),

      body: FutureBuilder<List<Task>>(
        future: tasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to load tasks'),
            );
          }

          final taskList = snapshot.data!;

          return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              final task = taskList[index];

              return ListTile(
                title: Text(task.title),
                trailing: Checkbox(
                  value: task.completed,
                  onChanged: (value) async {
                    await ApiService.updateTask(
                      task.id,
                      value!,
                    );

                    setState(() {
                      task.completed = value;
                    });
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
