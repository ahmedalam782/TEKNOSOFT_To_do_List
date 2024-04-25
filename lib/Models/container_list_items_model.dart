import 'package:flutter/material.dart';

class ContainerListItemsModel {
  final IconData iconData;
  final String headTitle;
  final String subTitle;
  final Function() onTap;

  ContainerListItemsModel({
    required this.iconData,
    required this.headTitle,
    required this.subTitle,
    required this.onTap,
  });
}
