import 'dart:async';

import 'package:get/get.dart';
import 'package:timxe/data/booking.dart';
import 'package:timxe/screens/login/services/get_schedule_api.dart';

class NavNotificationController extends GetxController {
  var bookingWaitProcessList = List<Booking>.empty().obs;
  var isLoading = true.obs;
  var isNotEmptyList=true.obs;
  @override
  void onInit() async {
    // Timer.periodic(
    //     Duration(seconds: 2),
    //     (Timer t) =>
    //         {print("TEST THỬ CHƠI TRONG NAVCONTROLLER"), fecthBookingWaitProcess()});
    fecthBookingWaitProcess();
    super.onInit();
    everAll(
        [bookingWaitProcessList],
        (callback) =>
            print('Change' + '${bookingWaitProcessList.value.length}'));
  }

  @override
  void onReady() {
    super.onReady();
    update();
  }

  void fecthBookingWaitProcess() async {
    try {
      isLoading(true);
      isNotEmptyList(true);
      var bookingWaitProcesses = await GetScheduleApi.fecthBookingWaitProcess();
      if (bookingWaitProcesses != null) {
        bookingWaitProcessList.assignAll(bookingWaitProcesses);
        if(bookingWaitProcessList.isEmpty){
          isNotEmptyList(false);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
