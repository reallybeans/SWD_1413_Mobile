
import 'package:get/get.dart';
import 'package:timxe/data/booking.dart';
import 'package:timxe/screens/login/services/get_schedule_api.dart';

class NewBookingController extends GetxController {
  var bookingWaitProcessList = List<Booking>.empty().obs;
  var isLoading = true.obs;
 
  @override
  void onInit() async {
    fecthBookingWaitProcess();
    
    // ignore: avoid_print
    print("TẠO MỚI");
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
      }
    } finally {
      isLoading(false);
    }
  }
}
