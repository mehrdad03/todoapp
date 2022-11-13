import 'package:todoapp/models/todo.dart';

class Task {
  final int id;
  late String title;
  String? description;
  List<Todo> todos;

  Task(
      {required this.title,
      this.description,
      required this.id,
      required this.todos});

  addNeTodo(value) {
    todos.add(Todo(
        id: DateTime.now().microsecondsSinceEpoch,
        title: value,
        isDone: false));
  }

  toggleDoneTodo(id) {
    todos = todos.map((todo) {
      if (todo.id == id) {
        todo.isDone = !todo.isDone;
      }
      return todo;
    }).toList();
  }
}
