import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WelcomeController>(WelcomeController(),permanent: true);
  }
}
