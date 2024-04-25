import 'package:flutter/material.dart';

class BuildGridListItemsModel {
  final Color backgroundColor;
  final IconData iconData;
  final String headTitle;
  final String subTitle;
  final Function() onTap;

  BuildGridListItemsModel({
    required this.backgroundColor,
    required this.iconData,
    required this.headTitle,
    required this.subTitle,
    required this.onTap,
  });
}
