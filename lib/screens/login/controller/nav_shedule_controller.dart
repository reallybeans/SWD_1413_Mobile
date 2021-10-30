// ignore_for_file: prefer_collection_literals
import 'dart:async';

import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:timxe/data/schedule.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';
import 'package:timxe/screens/login/services/get_schedule_api.dart';

class NavSheduleController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  // ignore: deprecated_member_use
  var scheduleList = List<Schedule>.empty().obs;

  @override
  void onInit() async {
    // Timer.periodic(Duration(seconds: 2), (Timer t) =>{
    //   print("TEST THỬ CHƠI TRONG NAVCONTROLLER"),
    //   fetchUsers()
    //   });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    update();
  }

  @override
  void onClose() {}
  void fetchUsers() async {
    var schedules = await GetScheduleApi.fetchUser();
    if (schedules != null) {
      scheduleList.value = schedules;
    }
  }
}
