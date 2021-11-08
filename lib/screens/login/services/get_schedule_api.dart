import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:timxe/config.dart';
import 'package:timxe/data/booking.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';

class GetScheduleApi {
  static var client = http.Client();

  static Future<List<Booking>?> fetchSchedule() async {
    HomeController homeController = Get.find<HomeController>();
    var response = await http.get(
        Uri.parse(
            '${Config.host}api/v1/booking/${homeController.currentDriver.id}/2'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    print("API SCHEDULE Status_code: "'${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      Iterable list = json.decode(jsonString);
      final bookings_Accept = list.cast<Map<String, dynamic>>();
      final listOfBookings_Accept = bookings_Accept.map<Booking>((json) {
        return Booking.fromJson(json);
      }).toList();
      // print('object');
      return listOfBookings_Accept;
    }
  }

  static Future<List<Booking>?> fecthBookingWaitProcess() async {
    HomeController homeController = Get.find<HomeController>();
    var response = await http.get(
        Uri.parse(
            '${Config.host}api/v1/booking/${homeController.currentDriver.id}/1'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    if (response.statusCode == 200) {
      var jsonString = response.body;
      Iterable list = json.decode(jsonString);

      final bookingsAccept = list.cast<Map<String, dynamic>>();
      final listOfBookingsAccept = bookingsAccept.map<Booking>((json) {
        return Booking.fromJson(json);
      }).toList();
      return listOfBookingsAccept;
    }
  }
   Future<String> getToken(String channelName) async {
    String link =
        "https://agora-node-tokenserver-1.davidcaleb.repl.co/access_token?channelName=${channelName}";
    var _response = await http.get(Uri.parse(link));
    Map data = jsonDecode(_response.body);
      String rsToken = data["token"];
      return Future<String>.value(rsToken);
  }
}
