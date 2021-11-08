import 'package:get/get.dart';
import 'package:timxe/data/vehicle.dart';
import 'package:timxe/screens/login/services/manage_vehicle_api.dart';

class ManageVehicleController extends GetxController {
  var vehiclesList = List<Vehicle>.empty().obs;
  var isLoading = false.obs;
  var reLoading = false.obs;
  @override
  void onInit() async {
    fectHistories();
    ever(reLoading, (callback) {
      if (reLoading.value) {
        fectHistories();
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    update();
    super.onReady();
  }

  @override
  void onClose() {}
  void fectHistories() async {
    try {
      reLoading(false);
      isLoading(true);
      var vehicles = await ManageVehicleApi.fetchVehicles();
      if (vehicles != null) {
        vehiclesList.assignAll(vehicles);
      }
    } finally {
      isLoading(false);
    }
  }
}
