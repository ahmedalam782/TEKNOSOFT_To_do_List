import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/UI/Cubit/cubit.dart';
import 'package:to_do_list_app/UI/Cubit/state.dart';

import '../../Components/text_form_field_component.dart';
import '../../Shared/constants/constants.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Container(
            color: const Color(0xffF3F7FF),
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextFormField(
                      controller: titleEditingController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.title,
                      labelText: 'Task Title',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Title must not be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: timeFromEditingController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.watch_later_outlined,
                      labelText: cubit.selectedValue == 'Personal'
                          ? 'Task Time'
                          : 'Task Time (From)',
                      onTap: () => showTimePicker(
                        initialEntryMode: TimePickerEntryMode.dial,
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then(
                        (value) => timeFromEditingController.text =
                            value!.format(context).toString(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Time must not be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: dateEditingController,
                      keyboardType: TextInputType.datetime,
                      prefixIcon: Icons.calendar_today,
                      labelText: 'Task Date',
                      onTap: () => showDatePicker(
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2099),
                      ).then((value) => dateEditingController.text =
                          DateFormat.yMMMd().format(value!).toString()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Date must not be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Expanded(
                              child: Text(
                                cubit.selectedValue!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: cubit.items
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                ))
                            .toList(),
                        value: cubit.selectedValue,
                        onChanged: (value) => cubit.changeValueDropDown(value),
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          // width: 160,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: const Color(0xffF3F7FF)),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.black,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color(0xffF3F7FF),
                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all(6),
                            thumbVisibility: MaterialStateProperty.all(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    cubit.selectedValue == 'Personal'
                        ? const SizedBox()
                        : CustomTextFormField(
                            controller: timeToEditingController,
                            keyboardType: TextInputType.text,
                            prefixIcon: Icons.watch_later_outlined,
                            labelText: 'Task Time (to)',
                            onTap: () => showTimePicker(
                              initialEntryMode: TimePickerEntryMode.dial,
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then(
                              (value) => timeToEditingController.text =
                                  value!.format(context).toString(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Time must not be empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
