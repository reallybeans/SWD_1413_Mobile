import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:timxe/data/schedulev1.dart';
import 'package:timxe/models/user.dart';

class GetScheduleApi {
  static var client = http.Client();
  static Future<List<Schedule>?> fetchUser() async {
    // var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users'),);
    // if (response.statusCode == 200) {
    // var jsonString = response.body;
    // Iterable list = json.decode(jsonString);
    Iterable list = [
      {
        "id": 1,
        "nameCustomer": "Richard Nguyen",
        "phone": "0794219089",
        "start": "12-11-2021",
        "timeWait": 3,
        "mode": true,
        "price": 2000000,
        "status": 2,
        "schedule": {
          "total": 4,
          "address": {
            "origin": "157 đường 265, quận 9, HCM",
            "destination": "64 Lũy Bán Bích, Tân Bình, HCM",
            "waypoint": [
              "Đường DT,Cần Thơ,Thành Phố Cần Thơ",
              "Đường MD, An Giang, Tỉnh An Giang"
            ]
          },
          "latlng": {
            "origin": "10.8449184,106.7905202",
            "destination": "10.8449184,106.7905202",
            "waypoint": ["10.8449184,106.7905202", "10.8449184,106.7905202"]
          }
        }
      },
        {
        "id": 2,
        "nameCustomer": "Duy Nguyen",
        "phone": "0794219089",
        "start": "23-11-2021",
        "timeWait": 3,
        "mode": false,
        "price": 2000000,
        "status": 2,
        "schedule": {
          "total": 2,
          "address": {
            "origin": "157 đường 265, quận 9, HCM",
            "destination": "64 Lũy Bán Bích, Tân Bình, HCM",
            "waypoint": [
              "Đường DT,Cần Thơ,Thành Phố Cần Thơ",
              "Đường MD, An Giang, Tỉnh An Giang"
            ]
          },
          "latlng": {
            "origin": "10.8449184,106.7905202",
            "destination": "10.8449184,106.7905202",
            "waypoint": ["10.8449184,106.7905202", "10.8449184,106.7905202"]
          }
        }
      },
      {
        "id": 3,
        "nameCustomer": "Anh Lê",
        "phone": "0794219089",
        "start": "4-12-2021",
        "timeWait": 3,
        "mode": false,
        "price": 2000000,
        "status": 2,
        "schedule": {
          "total": 2,
          "address": {
            "origin": "157 đường 265, quận 9, HCM",
            "destination": "64 Lũy Bán Bích, Tân Bình, HCM",
            "waypoint": [
              "Đường DT,Cần Thơ,Thành Phố Cần Thơ",
              "Đường MD, An Giang, Tỉnh An Giang"
            ]
          },
          "latlng": {
            "origin": "10.8449184,106.7905202",
            "destination": "10.8449184,106.7905202",
            "waypoint": ["10.8449184,106.7905202", "10.8449184,106.7905202"]
          }
        }
      }
    ];
    
    final schedules = list.cast<Map<String, dynamic>>();
    final listofschedules = await schedules.map<Schedule>((json) {
      return Schedule.fromJson(json);
    }).toList();
    return listofschedules;
  }
}
