import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list_app/UI/Cubit/state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  List<Map> lists = [];
  List<Map> upcoming = [];
  List<Map> myDay = [];
  List<Map> personal = [];
  List<Map> learning = [];
  List<Map> work = [];
  List<Map> shopping = [];
  List<Map> important = [];
  List<String> items = [
    'Personal',
    'Learning',
    'Work',
    'Shopping',
  ];
  late Database database;
  String? selectedValue = "Personal";
  bool floatClick = false;
  bool isImportant = false;
  IconData icon = Icons.edit;

  void changeValueDropDown(String? value) {
    selectedValue = value;
    emit(ChangeValueOfDropDown());
  }

  void changeImportantList() {
    isImportant = !isImportant;
    emit(AppChangeImportantList());
  }

  void changeBottomSheetState(
      {required bool isShow, required IconData fabIcon}) {
    floatClick = isShow;
    icon = fabIcon;
    emit(AppChangeBottomSheetState());
  }

  void createDatabase() async {
    emit(AppGetDataBaseLoadingState());
    database = await openDatabase('todo.db',
        version: 1,
        onCreate: (database, version) => database
            .execute(
                'CREATE TABLE tasks(id INTEGER PRIMARY KEY ,title TEXT,date TEXT,timeto TEXT,type TEXT,timefrom TEXT,important TEXT)')
            .then((value) => log('table created'))
            .catchError((error) => log(error.toString())),
        onOpen: (database) {
          log('Database opened');
          getDataFromDatabase(database);
        }).then((value) {
      emit(AppCreateDataBaseState());
      return database = value;
    });
  }

  Future insertDatabase({
    required String title,
    required String date,
    required String timeTo,
    required String type,
    required String timeFrom,
  }) async {
    emit(AppGetDataBaseLoadingState());
    await database.transaction((txn) => txn
            .rawInsert(
                'INSERT INTO tasks(title,date,timeto,type,timefrom,important) VALUES("$title","$date","$timeTo","$type","$timeFrom","false")')
            .then((value) {
          getDataFromDatabase(database);
          emit(AppInsertDataBaseState());
          log('$value Inserted Completed');
        }).catchError((error) {
          emit(AppErrorDataBaseState(error: error.toString()));
        }));
  }

  void getDataFromDatabase(database) {
    personal = [];
    learning = [];
    work = [];
    shopping = [];
    important = [];
    myDay = [];
    upcoming = [];
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['type'] == 'Personal') {
          personal.add(element);
        } else if (element['type'] == 'Learning') {
          learning.add(element);
        } else if (element['type'] == 'Work') {
          work.add(element);
        } else {
          shopping.add(element);
        }
        if (element['important'] == 'true') {
          important.add(element);
        }
        if (element['date'] ==
            DateFormat.yMMMd().format(DateTime.now()).toString()) {
          myDay.add(element);
        } else {
          upcoming.add(element);
        }
      });
      emit(AppGetDataBaseState());
    }).catchError((error) {
      emit(AppErrorDataBaseState(error: error.toString()));
    });
  }

  void updateDatabase({
    required String important,
    required int id,
  }) async {
    database.rawUpdate('UPDATE tasks SET important=? WHERE id=?',
        [important, id]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDataBaseState());
    }).catchError((error) {
      emit(AppErrorDataBaseState(error: error.toString()));
    });
  }

  void deleteDatabase({required int id}) async {
    database.rawUpdate('DELETE FROM tasks WHERE id=$id').then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDataBaseState());
    }).catchError((error) {
      emit(AppErrorDataBaseState(error: error.toString()));
    });
  }
}
