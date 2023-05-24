import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:weather_app/utilities/app_pages.dart';

void main() {
    tz.initializeTimeZones();
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode:ThemeMode.dark,
    initialRoute: AppPages.initialPage,
    getPages: AppPages.pages,
    //theme: AppTheme.themeData,
  ));
}




