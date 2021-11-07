// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/routes/app_pages.dart';
import 'package:timxe/screens/login/binding/home_binding.dart';
import 'package:timxe/screens/login/binding/nav_notify_binding.dart';
import 'package:timxe/screens/login/binding/nav_shedule_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HomeBinding().dependencies();
  //  NavSheduleBinding().dependencies();
  runApp(
    GetMaterialApp(
      title: "Application",
      // initialBinding: AllBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
