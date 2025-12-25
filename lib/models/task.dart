class Task {
  final int id;
  final String title;
  bool completed;

  Task({
    required this.id,
    required this.title,
    required this.completed,
  });

  // Convert JSON from API to Task object
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
