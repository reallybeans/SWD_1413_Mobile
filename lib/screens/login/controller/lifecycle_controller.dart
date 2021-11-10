import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';
import 'package:timxe/screens/login/services/update_driver_api.dart';

class LifeCycleController extends SuperController {
  @override
  Future<void> onDetached() async {
    // ignore: avoid_print
    //  await UpdateDriverApi().updateStatusDriver(Get.find<HomeController>().currentDriver.id);
    print("Hàm detactch chạy");
  //  Get.find<HomeController>().onlineDriver(false);
  }

  @override
  void onInactive() {
    print("Hàm inactive chạy");
  }

  @override
  void onPaused() {
    
            // Get.find<NavNotificationController>().onlineDriver();
    print("Hàm pauches chạy");
  }

  @override
  void onResumed() {
    print("Hàm resum chạy");
  }
}
