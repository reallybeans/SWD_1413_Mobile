import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:timxe/data/driver.dart';

class ApiService {
  final user = FirebaseAuth.instance.currentUser;

  Future<Driver> apiCheckLogin(String token, String deviceId) async {
    Driver rs;
    // ignore: avoid_print
    print("CheckLogin_Api TokenGG: " + deviceId);
    var body = jsonEncode({'token': token, 'diviceId': deviceId});
    var response = await http.post(
        Uri.parse("http://3.138.105.45/api/v1/auth/login-driver"),
        body: body,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });

    // ignore: avoid_print
    print("CheckLogin_Api Status_Code: " '$response.statusCode');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      Map<String, dynamic> map = json.decode(jsonString);
      Map<String, dynamic> data = map["data"];
      rs = Driver.fromJson(data);
      print('cai nay la rs: ${rs}');
      return Future<Driver>.value(rs);
    } else
      // ignore: null_argument_to_non_null_type
      return Future<Driver>.value(null);
  }

  Future<Driver> apiCheckLoginPhone(String phone) async {
    Driver rs;
    String str = phone;
    phone = '0' + str;
    print("object" + phone);
    var body = jsonEncode({'phone': phone});
    var response = await http.post(
        Uri.parse("http://3.138.105.45/api/v1/auth/login-driver"),
        body: body,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    // ignore: avoid_print
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      Map<String, dynamic> map = json.decode(jsonString);
      Map<String, dynamic> data = map["data"];
      rs = Driver.fromJson(data);
      return Future<Driver>.value(rs);
      // return Future<bool>.value(false);
    } else {
      return Future<Driver>.value(null);
      // return Future<bool>.value(true);
    }
  }
}
