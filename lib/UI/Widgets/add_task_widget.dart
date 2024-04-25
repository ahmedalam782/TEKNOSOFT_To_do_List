import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/UI/Cubit/cubit.dart';
import 'package:to_do_list_app/UI/Cubit/state.dart';

import '../../Shared/constants/constants.dart';
import 'bottom_sheet_widget.dart';

class AddTasksWidget extends StatelessWidget {
  const AddTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppInsertDataBaseState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return FloatingActionButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: const Color(0xff567EB0),
          shape: const CircleBorder(),
          onPressed: () {
            if (cubit.floatClick) {
              if (formKey.currentState!.validate()) {
                cubit.insertDatabase(
                  title: titleEditingController.text,
                  date: dateEditingController.text,
                  timeTo: timeFromEditingController.text,
                  type: cubit.selectedValue!,
                  timeFrom: cubit.selectedValue == 'Personal'
                      ? ''
                      : timeToEditingController.text,
                );
              }
            } else {
              scaffoldKey.currentState!
                  .showBottomSheet(
                    (context) => const BottomSheetWidget(),
                  )
                  .closed
                  .then((value) {
                cubit.changeBottomSheetState(
                  isShow: false,
                  fabIcon: Icons.add,
                );
                titleEditingController.clear();
                timeFromEditingController.clear();
                dateEditingController.clear();
                timeToEditingController.clear();
              });
              cubit.changeBottomSheetState(
                isShow: true,
                fabIcon: Icons.edit,
              );
            }
          },
          child: Icon(
            cubit.icon,
          ),
        );
      },
    );
  }
}
