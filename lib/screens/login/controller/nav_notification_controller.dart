import 'dart:async';

import 'package:get/get.dart';
import 'package:timxe/data/booking.dart';
import 'package:timxe/screens/login/services/get_schedule_api.dart';

class NavNotificationController extends GetxController {
  var bookingWaitProcessList = List<Booking>.empty().obs;
  var isLoading = true.obs;
  var isNotEmptyList = true.obs;
  var returnResponseBooking = false.obs;
  var onlineDriver = false.obs;
  late Timer  timerScanBooking;
  @override
  void onInit() async {
    // Timer.periodic(
    //     Duration(seconds: 2),
    //     (Timer t) =>
    //         {print("TEST THỬ CHƠI TRONG NAVCONTROLLER"), fecthBookingWaitProcess()});
    ever(
        onlineDriver,
        (callback) => {
          print("${onlineDriver}"),
              if (onlineDriver.value) {fecthBookingWaitProcess()} else{}
            });
    //     ever(driverBusy,(callback)=>{
    //   if(driverBusy.value){
    //     print('GOI API DOI DRIVER THANH BUSY')
    //   }else{
    //     print('GOI API DOI DRIVER THANH FREE')
    //   }
    // });
    ever(
        isNotEmptyList,
        (callback) => {
              print('Change' + '${isNotEmptyList.value}'),
              if (!isNotEmptyList.value && onlineDriver.value)
                {
                  print('GOI API DOI DRIVER THANH FREE'),
                  scanBooking(),
                }
              else
                {
                  print('GOI API DOI DRIVER THANH BUSY'),
                }
            });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    update();
  }

  void fecthBookingWaitProcess() async {
    try {
      isLoading(true);
      var bookingWaitProcesses = await GetScheduleApi.fecthBookingWaitProcess();
      if (bookingWaitProcesses != null) {
        bookingWaitProcessList.assignAll(bookingWaitProcesses);
        if (bookingWaitProcessList.isEmpty) {
          isNotEmptyList(false);
        } else {
          isNotEmptyList(true);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void scanBooking() async {
  timerScanBooking=  Timer.periodic(
        const Duration(seconds: 2),
        (Timer t) => {
              fecthBookingWaitProcess(),
              if (isNotEmptyList.value)
                {
                  t.cancel(),
                }
            });
  }
}
