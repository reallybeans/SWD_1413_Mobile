import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:timxe/data/history.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';

class GetHistoryApi {
  static var client = http.Client();
  static Future<List<History>?> fetchHistory() async {
       HomeController homeController = Get.find<HomeController>();
    var response = await http.get(
        Uri.parse(
            'http://3.138.105.45/api/v1/transaction/get-by-driver-${homeController.currentDriver.id}'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    Map data = jsonDecode(response.body);
    Iterable list = data['data'];
    final history = list.cast<Map<String, dynamic>>();
    final listofhistory = await history.map<History>((json) {
      return History.fromJson(json);
    }).toList();
    print('object');
    return listofhistory;
  }
}
// }
