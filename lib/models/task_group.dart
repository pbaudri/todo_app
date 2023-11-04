import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskGroup {
  TaskGroup({
    required this.color,
    required this.icon,
    required this.name,
    required this.tasks,
  });

  final Color color;
  final IconData icon;
  final String name;
  final List<Task> tasks;
}
