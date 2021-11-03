import 'dart:async';

import 'package:get/get.dart';
import 'package:timxe/data/booking.dart';
import 'package:timxe/screens/login/services/get_schedule_api.dart';

class NavNotificationController extends GetxController {
  var bookingWaitProcessList = List<Booking>.empty().obs;

  @override
  void onInit() async {
    // Timer.periodic(
    //     Duration(seconds: 2),
    //     (Timer t) =>
    //         {print("TEST THỬ CHƠI TRONG NAVCONTROLLER"), fetchUsers()});
    fecthBookingWaitProcess();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    update();
  }

  @override
  void onClose() {}
  void fecthBookingWaitProcess() async {
    var bookingWaitProcesses = await GetScheduleApi.fecthBookingWaitProcess();
    if (bookingWaitProcesses != null) {
      bookingWaitProcessList.value = bookingWaitProcesses;
    }
  }
}
