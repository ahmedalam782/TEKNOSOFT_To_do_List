import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/UI/Cubit/cubit.dart';
import 'package:to_do_list_app/UI/Cubit/state.dart';
import 'package:to_do_list_app/UI/Screens/important_tasks_screen.dart';
import 'package:to_do_list_app/UI/Screens/learning_screen.dart';
import 'package:to_do_list_app/UI/Screens/personal_screen.dart';
import 'package:to_do_list_app/UI/Screens/shopping_screen.dart';
import 'package:to_do_list_app/UI/Screens/today_tasks_screen.dart';
import 'package:to_do_list_app/UI/Screens/upcoming_tasks_screen.dart';
import 'package:to_do_list_app/UI/Screens/work_screen.dart';

import '../../Models/build_grid_list_items_model.dart';
import '../../Models/container_list_items_model.dart';
import '../../Shared/constants/constants.dart';
import '../Widgets/add_task_widget.dart';
import '../Widgets/build_grid_list_items.dart';
import '../Widgets/container_list_items.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        List<BuildGridListItemsModel> buildGridListItemsModel = [
          BuildGridListItemsModel(
            backgroundColor: const Color(0xff6986D3),
            iconData: Icons.person,
            headTitle: 'Personal',
            subTitle: "${cubit.personal.length} Tasks",
            onTap: () => Navigator.pushNamed(context, PersonalScreen.routeName),
          ),
          BuildGridListItemsModel(
            backgroundColor: const Color(0xff9172B1),
            iconData: Icons.edit,
            headTitle: 'Learning',
            subTitle: "${cubit.learning.length} Tasks",
            onTap: () => Navigator.pushNamed(context, LearningScreen.routeName),
          ),
          BuildGridListItemsModel(
            backgroundColor: const Color(0xff6290B9),
            iconData: Icons.work,
            headTitle: 'Work',
            subTitle: "${cubit.work.length} Tasks",
            onTap: () => Navigator.pushNamed(context, WorkScreen.routeName),
          ),
          BuildGridListItemsModel(
            backgroundColor: const Color(0xffEE7574),
            iconData: Icons.shopping_bag,
            headTitle: 'Shopping',
            subTitle: "${cubit.shopping.length} Tasks",
            onTap: () => Navigator.pushNamed(context, ShoppingScreen.routeName),
          ),
        ];
        List<ContainerListItemsModel> containerListItemsModel = [
          ContainerListItemsModel(
            iconData: Icons.wb_sunny_outlined,
            headTitle: 'My Day',
            subTitle: "${cubit.myDay.length} Tasks",
            onTap: () =>
                Navigator.pushNamed(context, TodayTaskScreen.routeName),
          ),
          ContainerListItemsModel(
            iconData: Icons.calendar_month,
            headTitle: 'Upcoming',
            subTitle: "${cubit.upcoming.length} Tasks",
            onTap: () =>
                Navigator.pushNamed(context, UpcomingTaskScreen.routeName),
          ),
          ContainerListItemsModel(
            iconData: Icons.star,
            headTitle: 'Important',
            subTitle: "${cubit.important.length} Tasks",
            onTap: () =>
                Navigator.pushNamed(context, ImportantTaskScreen.routeName),
          ),
        ];
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(0xffF3F7FF),
          appBar: AppBar(
            backgroundColor: const Color(0xffF3F7FF),
            title: Text(
              'Lists',
              style: GoogleFonts.peralta(
                textStyle: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Today's Progress",
                          style: GoogleFonts.peralta(
                            textStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff2466CF).withOpacity(.6),
                            ),
                          ),
                        ),
                        TextSpan(
                          text: " ${cubit.myDay.length} Tasks left ",
                          style: GoogleFonts.peralta(
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 225,
                  padding: const EdgeInsets.all(18),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.white)),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ContainerListItems(
                      iconData: containerListItemsModel[index].iconData,
                      headTitle: containerListItemsModel[index].headTitle,
                      subTitle: containerListItemsModel[index].subTitle,
                      onTap: containerListItemsModel[index].onTap,
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                      thickness: .4,
                    ),
                    itemCount: containerListItemsModel.length,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 160,
                  ),
                  itemBuilder: (context, index) => BuildGridListItems(
                    backgroundColor:
                        buildGridListItemsModel[index].backgroundColor,
                    iconData: buildGridListItemsModel[index].iconData,
                    headTitle: buildGridListItemsModel[index].headTitle,
                    subTitle: buildGridListItemsModel[index].subTitle,
                    onTap: buildGridListItemsModel[index].onTap,
                  ),
                  itemCount: buildGridListItemsModel.length,
                ),
              ],
            ),
          ),
          floatingActionButton: const AddTasksWidget(),
        );
      },
    );
  }
}
