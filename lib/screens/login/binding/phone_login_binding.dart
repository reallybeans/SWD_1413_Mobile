import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/phone_login_controller.dart';

class PhoneLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PhoneLoginController>(PhoneLoginController());
  }
}
