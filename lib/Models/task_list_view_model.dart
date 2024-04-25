import 'package:flutter/material.dart';

class TaskListViewModel {
  final String taskTitle;
  final Color taskTitleColor;
  final String taskTime;
  final Color taskTypeColor;
  final String taskType;
  final Color taskImportantColor;

  TaskListViewModel({
    required this.taskTitleColor,
    required this.taskTime,
    required this.taskTypeColor,
    required this.taskType,
    required this.taskImportantColor,
    required this.taskTitle,
  });
}
