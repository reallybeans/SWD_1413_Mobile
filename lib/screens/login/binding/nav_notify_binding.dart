import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/nav_notification_controller.dart';
import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';
import 'package:timxe/screens/login/controller/start_controller.dart';


class NavNotifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavNotificationController(),permanent: true);
  }
}
