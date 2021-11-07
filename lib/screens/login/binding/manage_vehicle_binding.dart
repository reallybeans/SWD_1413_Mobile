import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/manage_vehicle_controller.dart';

class ManageVehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ManageVehicleController>(ManageVehicleController());
  }
}
