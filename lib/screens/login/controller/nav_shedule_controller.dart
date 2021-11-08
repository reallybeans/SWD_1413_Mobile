// ignore_for_file: prefer_collection_literals
import 'dart:async';

import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:timxe/data/booking.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';
import 'package:timxe/screens/login/services/get_schedule_api.dart';

class NavSheduleController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  // ignore: deprecated_member_use
  var scheduleList = List<Booking>.empty().obs;
  var isLoading = true.obs;
  // SystemWindowPrefMode prefMode = SystemWindowPrefMode.OVERLAY;

  @override
  void onInit() async {
    fetchSchedule();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    update();
  }

  @override
  void onClose() {}

  void fetchSchedule() async {
    try {
      isLoading(true);
      var bookingsAccept = await GetScheduleApi.fetchSchedule();
      if (bookingsAccept != null) {
        scheduleList.assignAll(bookingsAccept);
      }
    } finally {
      isLoading(false);
    }
  }
}

