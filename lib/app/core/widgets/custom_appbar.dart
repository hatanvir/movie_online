import 'package:flutter/material.dart';
import 'package:movie_online/app/core/values/app_colors.dart';

AppBar customAppbar({
  required String title
}) => AppBar(
  title: Text(title),
  centerTitle: true,
  leading: const Icon(Icons.menu,color: AppColor.blackColor,),
  actions: [
    CircleAvatar(
      backgroundColor: AppColor.whiteColor,
      child: Image.asset('assets/avatar.png'),
    )
  ],
);