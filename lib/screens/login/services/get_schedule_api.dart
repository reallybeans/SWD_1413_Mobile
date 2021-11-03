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
      // Iterable list = [
      //   {
      //     "id": 1,
      //     "nameCustomer": "Richard Nguyen",
      //     "phone": "0794219089",
      //     "start": "12-11-2021",
      //     "timeWait": 3,
      //     "mode": true,
      //     "price": 2230000,
      //     "status": 2,
      //     "schedule": {
      //       "total": 2,
      //       "address": {
      //         "origin": "157 đường 265, quận 9, HCM",
      //         "destination": "Decal Luân Nguyễn, Đường tỉnh 712, Tân Thuận, Hàm Thuận Nam District, Bình Thuận Province",
      //         "waypoint": [
      //           "FPT University HCMC, Khu Công Nghệ Cao, Long Thạnh Mỹ, Thành Phố Thủ Đức, Ho Chi Minh City",
      //           "Hồ Bơi Hiệp Phước, Đường tỉnh 712, Hiệp Phước, Tân Thuận, Hàm Thuận Nam District, Bình Thuận Province",
      //         ]
      //       },
      //       "latlng": {
      //         "origin": "10.846743686764038, 106.78613659757532",
      //         "destination": "10.746686724329491, 107.87721206873913",
      //         "waypoint": [
      //           "10.841611040296401, 106.81005712641063",
      //           "10.942435594042163, 107.21535174643958"
      //         ]
      //       }
      //     }
      //   },
      //   {
      //     "id": 2,
      //     "nameCustomer": "Duy Nguyen",
      //     "phone": "0794219089",
      //     "start": "23-11-2021",
      //     "timeWait": 0,
      //     "mode": false,
      //     "price": 1500000,
      //     "status": 2,
      //     "schedule": {
      //       "total": 2,
      //       "address": {
      //         "origin": "157 đường 265, quận 9, HCM",
      //         "destination": "64 Lũy Bán Bích, Tân Bình, HCM",
      //         "waypoint": [
      //           "Đường DT,Cần Thơ,Thành Phố Cần Thơ",
      //           "Đường MD, An Giang, Tỉnh An Giang"
      //         ]
      //       },
      //       "latlng": {
      //         "origin": "10.846743686764038, 106.78613659757532",
      //         "destination": "10.746686724329491, 107.87721206873913",
      //         "waypoint": [
      //           "10.841611040296401, 106.81005712641063",
      //           "10.942435594042163, 107.21535174643958"
      //         ]
      //       }
      //     }
      //   },
      //   {
      //     "id": 3,
      //     "nameCustomer": "Anh Lê",
      //     "phone": "0794219089",
      //     "start": "4-12-2021",
      //     "timeWait": 3,
      //     "mode": false,
      //     "price": 2000000,
      //     "status": 2,
      //     "schedule": {
      //       "total": 2,
      //       "address": {
      //         "origin": "157 đường 265, quận 9, HCM",
      //         "destination": "64 Lũy Bán Bích, Tân Bình, HCM",
      //         "waypoint": [
      //           "Đường DT,Cần Thơ,Thành Phố Cần Thơ",
      //           "Đường MD, An Giang, Tỉnh An Giang"
      //         ]
      //       },
      //       "latlng": {
      //         "origin": "10.846743686764038, 106.78613659757532",
      //         "destination": "10.746686724329491, 107.87721206873913",
      //         "waypoint": [
      //           "10.841611040296401, 106.81005712641063",
      //           "10.942435594042163, 107.21535174643958"
      //         ]
      //       }
      //     }
      //   }
      // ];

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

      final bookings_Accept = list.cast<Map<String, dynamic>>();
      final listOfBookings_Accept = bookings_Accept.map<Booking>((json) {
        return Booking.fromJson(json);
      }).toList();
      // print('object');
      return listOfBookings_Accept;
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
