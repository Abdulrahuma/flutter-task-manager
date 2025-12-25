import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class ApiService {
  static const String baseUrl =
      'https://jsonplaceholder.typicode.com';

  // GET: Fetch all tasks
  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(
      Uri.parse('$baseUrl/todos'),
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Task.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  // POST: Add new task
  static Future<void> addTask(String title) async {
    await http.post(
      Uri.parse('$baseUrl/todos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': title,
        'completed': false,
      }),
    );
  }

  // PATCH: Update task completed status
  static Future<void> updateTask(int id, bool completed) async {
    await http.patch(
      Uri.parse('$baseUrl/todos/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'completed': completed,
      }),
    );
  }
}
