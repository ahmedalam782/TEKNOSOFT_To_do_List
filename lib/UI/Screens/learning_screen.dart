import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Cubit/cubit.dart';
import '../Cubit/state.dart';
import '../Widgets/task_builder.dart';

class LearningScreen extends StatelessWidget {
  static const String routeName = 'LearningScreen';

  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var tasks = AppCubit.get(context).learning;
        return Scaffold(
          backgroundColor: const Color(0xffF3F7FF),
          appBar: AppBar(
            backgroundColor: const Color(0xffF3F7FF),
            title: Text(
              'Learning Lists',
              style: GoogleFonts.peralta(
                textStyle: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff9172B1)),
              ),
            ),
          ),
          body: TaskBuilder(
            tasks: tasks,
            taskTitleColor: const Color(0xff9172B1),
            taskPersonalColor: const Color(0xff6986D3),
            taskLearningColor: const Color(0xff9172B1),
            taskWorkColor: const Color(0xff6290B9),
            taskShoppingColor: const Color(0xffEE7574),
            taskImportantColor: Colors.green,
            taskUnImportantColor: const Color(0xff9172B1),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
