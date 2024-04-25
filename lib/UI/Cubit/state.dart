abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangeValueOfDropDown extends AppStates {}

class AppChangeBottomSheetState extends AppStates {}

class AppCreateDataBaseState extends AppStates {}

class AppInsertDataBaseState extends AppStates {}

class AppGetDataBaseState extends AppStates {}

class AppGetDataBaseLoadingState extends AppStates {}

class AppUpdateDataBaseState extends AppStates {}

class AppDeleteDataBaseState extends AppStates {}

class AppChangeImportantList extends AppStates {}

class AppErrorDataBaseState extends AppStates {
  final String error;

  AppErrorDataBaseState({required this.error});
}
