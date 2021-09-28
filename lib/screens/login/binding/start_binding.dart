import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/start_controller.dart';


class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StartController>(StartController());
  }
}
