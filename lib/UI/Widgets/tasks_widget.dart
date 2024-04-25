import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Cubit/cubit.dart';

class TasksWidgets extends StatelessWidget {
  final Color taskTypeColor;
  final Color taskImportantColor;
  final Map tasks;
  final IconData iconData;

  const TasksWidgets({
    super.key,
    required this.taskTypeColor,
    required this.taskImportantColor,
    required this.tasks,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(tasks['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDatabase(id: tasks['id']);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(.7),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.circle_outlined,
              size: 45,
              color: Color(0xffB6B8C6),
            ),
            const Spacer(
              flex: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tasks['title'],
                  style: GoogleFonts.peralta(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: taskTypeColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  tasks['type'] == 'Personal'
                      ? "${tasks['timeto']}"
                      : "${tasks['timeto']}-${tasks['timefrom']}",
                  style: GoogleFonts.peralta(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.withOpacity(.8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${tasks['date']}",
                  style: GoogleFonts.peralta(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.withOpacity(.8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                      color: taskTypeColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      tasks['type'],
                      style: GoogleFonts.peralta(
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(
              flex: 5,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDatabase(
                  important: 'true',
                  id: tasks['id'],
                );
              },
              icon: Icon(
                iconData,
                size: 40,
                color: taskImportantColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
