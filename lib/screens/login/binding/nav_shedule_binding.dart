import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';


class NavSheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavSheduleController(),permanent: true);
  }
}
