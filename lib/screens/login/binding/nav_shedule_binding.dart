import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';
import 'package:timxe/screens/login/controller/start_controller.dart';


class NavSheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NavSheduleController>(NavSheduleController());
  }
}
