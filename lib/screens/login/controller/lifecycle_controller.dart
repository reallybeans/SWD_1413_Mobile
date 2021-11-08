import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';
import 'package:timxe/screens/login/controller/nav_notification_controller.dart';
import 'package:timxe/screens/login/services/checklogin_api.dart';
import 'package:timxe/screens/login/services/update_driver_api.dart';
import 'package:timxe/screens/login/views/home_view.dart';

class LifeCycleController extends SuperController {
  @override
  void onDetached() {
    print("Hàm detactch chạy");
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
