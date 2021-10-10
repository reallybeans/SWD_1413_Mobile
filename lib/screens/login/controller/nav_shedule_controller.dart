// ignore_for_file: prefer_collection_literals

import 'package:get/get.dart';


import 'package:get/state_manager.dart';
import 'package:timxe/data/schedulev1.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';
import 'package:timxe/screens/login/services/get_schedule_api.dart';
class NavSheduleController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  // ignore: deprecated_member_use
  var scheduleList =List<Schedule>.empty().obs;

  @override
  void onInit() async {
    fetchUsers();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void fetchUsers() async {
    var schedules = await GetScheduleApi.fetchUser();
    if(schedules!=null){
      scheduleList.value=schedules;
    }
  }
}
