import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/UI/Widgets/tasks_widget.dart';

class TaskBuilder extends StatelessWidget {
  final List<Map> tasks;
  final Color taskTitleColor;
  final Color taskPersonalColor;
  final Color taskLearningColor;
  final Color taskWorkColor;
  final Color taskShoppingColor;
  final Color taskImportantColor;
  final Color taskUnImportantColor;

  const TaskBuilder({
    super.key,
    required this.tasks,
    required this.taskTitleColor,
    required this.taskImportantColor,
    required this.taskPersonalColor,
    required this.taskLearningColor,
    required this.taskWorkColor,
    required this.taskShoppingColor,
    required this.taskUnImportantColor,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: tasks.isNotEmpty,
      builder: (context) => ListView.builder(
        itemBuilder: (context, index) => TasksWidgets(
          tasks: tasks[index],
          taskTypeColor: tasks[index]['type'] == 'Personal'
              ? taskPersonalColor
              : tasks[index]['type'] == 'Learning'
                  ? taskLearningColor
                  : tasks[index]['type'] == 'Work'
                      ? taskWorkColor
                      : taskShoppingColor,
          taskImportantColor: tasks[index]['important'] == 'true'
              ? taskImportantColor
              : taskUnImportantColor,
          iconData: tasks[index]['important'] == 'true'
              ? Icons.star
              : Icons.star_border,
        ),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 60,
              color: taskTitleColor,
            ),
            Text(
              'No Tasks Added yet ',
              style: GoogleFonts.peralta(
                textStyle: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: taskTitleColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
