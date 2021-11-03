import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:timxe/data/history.dart';

class GetHistoryApi {
  static var client = http.Client();
  static Future<List<History>?> fetchUser() async {
    var response = await http
        .get(Uri.parse('http://3.138.105.45/api/v1/booking/1/3'), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    // if (response.statusCode == 200) {
    //   var jsonString = response.body;
    // Iterable list = json.decode(jsonString);
    Iterable list = [
      {
        "id": 3,
        "customerName": "Mỹ Nhân Ngư Anonymous",
        "phoneCustomer": "0686868686",
        "mode": false,
        "price": 0,
        "timeWait": 0,
        "status": "Cancel",
        "date": "2021-11-01T14:19:18.217",
        "startDate": "2021-11-07T14:13:13.523",
        "schedule": {
          "total": 4,
          "address": {
            "origin":
                "157 Đường Số 265, Hiệp Phú, Quận 9, Thành phố Hồ Chí Minh",
            "destination":
                "Decal Luân Nguyễn, ĐT712, Tân Thuận, Hàm Thuận Nam, Bình Thuận",
            "waypoint": [
              "Suối Mơ, Trảng Dài, Thành phố Biên Hòa, Đồng Nai, Vietnam",
              "Bệnh Viện Đa Khoa Khu Vực Long Khánh, 911 21/4 Phường Suối Tre TP, Long Khánh, Đồng Nai, Vietnam"
            ]
          },
          "latlng": {
            "origin": "10.846943615481322,106.78674009763859",
            "destination": "10.747724999749847,107.87697798188127",
            "waypoint":
                "11.00344853067262,106.86746016262066|10.94243671965175,107.21510082923109|",
            "listWaypoint": null
          }
        }
      },
      {
        "id": 4,
        "customerName": "Mỹ Nhân Ngư Anonymous",
        "phoneCustomer": "0686868686",
        "mode": false,
        "price": 1412400,
        "timeWait": 0,
        "status": "Done",
        "date": "2021-11-01T14:19:18.217",
        "startDate": "2021-11-07T14:13:13.523",
        "schedule": {
          "total": 4,
          "address": {
            "origin":
                "157 Đường Số 265, Hiệp Phú, Quận 9, Thành phố Hồ Chí Minh",
            "destination":
                "Decal Luân Nguyễn, ĐT712, Tân Thuận, Hàm Thuận Nam, Bình Thuận",
            "waypoint": [
              "Suối Mơ, Trảng Dài, Thành phố Biên Hòa, Đồng Nai, Vietnam",
              "Bệnh Viện Đa Khoa Khu Vực Long Khánh, 911 21/4 Phường Suối Tre TP, Long Khánh, Đồng Nai, Vietnam"
            ]
          },
          "latlng": {
            "origin": "10.846943615481322,106.78674009763859",
            "destination": "10.747724999749847,107.87697798188127",
            "waypoint":
                "11.00344853067262,106.86746016262066|10.94243671965175,107.21510082923109|",
            "listWaypoint": null
          }
        }
      }
    ];

    final history = list.cast<Map<String, dynamic>>();
    final listofhistory = await history.map<History>((json) {
      return History.fromJson(json);
    }).toList();
    print('object');
    return listofhistory;
  }
}
// }
