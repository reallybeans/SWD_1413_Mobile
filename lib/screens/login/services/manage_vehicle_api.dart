import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:timxe/data/vehicle.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';

class ManageVehicleApi {
  static var client = http.Client();
  static Future<List<Vehicle>?> fetchVehicles() async {
       HomeController homeController = Get.find<HomeController>();
    var response = await http.get(
        Uri.parse(
            'http://3.138.105.45/api/v1/vehicles/get-by-driver-id/${homeController.currentDriver.id}'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    Map data = jsonDecode(response.body);
    Iterable list = data['data'];
    final vehicles = list.cast<Map<String, dynamic>>();
    final listofvehicles = await vehicles.map<Vehicle>((json) {
      return Vehicle.fromJson(json);
    }).toList();
    return listofvehicles;
  }
    Future<bool> updateStatusVehicle(int vehicleId,String status) async {
  
    var body = jsonEncode({'id': vehicleId,'status':status});
    var response = await http.put(
        Uri.parse("http://3.138.105.45/api/v1/vehicles/update-status?id=${vehicleId}&status=${status}"),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
      
    // ignore: avoid_print
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }
}
