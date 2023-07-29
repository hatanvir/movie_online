import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_online/app/bindings/initial_bindings.dart';
import 'package:movie_online/app/core/values/app_colors.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final dbFolder = await getApplicationDocumentsDirectory();
  Hive.init(dbFolder.path);

  runApp(
    GetMaterialApp(
      initialBinding: InitialBindings(),
      title: "MovieOnline",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: AppColor.primaryColor,
          titleTextStyle: TextStyle(color: AppColor.blackColor,fontSize: 18),
          elevation: 0
        )
      ),
    ),
  );
}
