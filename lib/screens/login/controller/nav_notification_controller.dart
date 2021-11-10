// import 'dart:async';

// import 'package:get/get.dart';
// import 'package:timxe/data/booking.dart';
// import 'package:timxe/screens/login/controller/home_controller.dart';
// import 'package:timxe/screens/login/services/get_schedule_api.dart';
// import 'package:timxe/screens/login/services/update_driver_api.dart';

// class NavNotificationController extends GetxController {
//   var bookingWaitProcessList = List<Booking>.empty().obs;
//   var isLoading = true.obs;
//   // var isNotEmptyList = false.obs;
//   var returnResponseBooking = false.obs;
//   var onlineDriver = false.obs;
//   var isNewBooking=false.obs;
//   late Timer timerScanBooking;
//   @override
//   void onInit() async {
//     ever(
//         onlineDriver,
//         (callback) async => {
//               if (onlineDriver.value)
//                 {
//                   await UpdateDriverApi().updateStatusDriver(
//                       Get.find<HomeController>().currentDriver.id, "on"),
//                   fecthBookingWaitProcess()
//                 }
//               else
//                 {
//                   await UpdateDriverApi().updateStatusDriver(
//                       Get.find<HomeController>().currentDriver.id, "off"),
//                 }
//             });
//     ever(
//         isNotEmptyList,
//         (callback) async => {
//               print('Change' + '${isNotEmptyList.value}'),
//               if (!isNotEmptyList.value && onlineDriver.value)
//                 {
//                   await UpdateDriverApi().updateStatusDriver(
//                       Get.find<HomeController>().currentDriver.id, "on"),
//                   scanBooking(),
//                 }
//               else
//                 {
//                   await UpdateDriverApi().updateStatusDriver(
//                       Get.find<HomeController>().currentDriver.id, "busy"),
//                 }
//             });

//             ever(isNewBooking, (callback) => {
//               if(isNewBooking.value){
//                   //isNewBooking = true
//                 //Nếu Có Cuốc mới thì fetchCuốc
//                 fecthBookingWaitProcess()
//                 //isNewBooking = false
//               }
//             });

//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//     update();
//   }

//   void fecthBookingWaitProcess() async {
//     try {
//       isLoading(true);
//       var bookingWaitProcesses = await GetScheduleApi.fecthBookingWaitProcess();
//       if (bookingWaitProcesses != null) {
//         bookingWaitProcessList.assignAll(bookingWaitProcesses);
//         if (bookingWaitProcessList.isEmpty) {
//           isNotEmptyList(false);
//         } else {
//           isNotEmptyList(true);
//         }
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   void scanBooking() async {
//     timerScanBooking = Timer.periodic(
//         const Duration(seconds: 2),
//         (Timer t) => {
//               fecthBookingWaitProcess(),
//               if (isNotEmptyList.value)
//                 {
//                   t.cancel(),
//                 }
//             });
//   }
// }
