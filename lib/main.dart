import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/UI/Cubit/state.dart';
import 'package:to_do_list_app/UI/Screens/important_tasks_screen.dart';
import 'package:to_do_list_app/UI/Screens/learning_screen.dart';
import 'package:to_do_list_app/UI/Screens/personal_screen.dart';
import 'package:to_do_list_app/UI/Screens/shopping_screen.dart';
import 'package:to_do_list_app/UI/Screens/today_tasks_screen.dart';
import 'package:to_do_list_app/UI/Screens/upcoming_tasks_screen.dart';
import 'package:to_do_list_app/UI/Screens/work_screen.dart';

import 'Shared/constants/bloc_observer.dart';
import 'UI/Cubit/cubit.dart';
import 'UI/Screens/home_screen.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: HomeScreen.routeName,
            routes: {
              HomeScreen.routeName: (_) => const HomeScreen(),
              PersonalScreen.routeName: (_) => const PersonalScreen(),
              LearningScreen.routeName: (_) => const LearningScreen(),
              WorkScreen.routeName: (_) => const WorkScreen(),
              ShoppingScreen.routeName: (_) => const ShoppingScreen(),
              TodayTaskScreen.routeName: (_) => const TodayTaskScreen(),
              UpcomingTaskScreen.routeName: (_) => const UpcomingTaskScreen(),
              ImportantTaskScreen.routeName: (_) => const ImportantTaskScreen(),
            },
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
