import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final user = FirebaseAuth.instance.currentUser;

  Future<bool> apiCheckLogin(String token) async {
    // ignore: avoid_print
    print("Tao ne: " '$token');
    var body = jsonEncode({'token': token});
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
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }

  Future<bool> apiCheckLoginPhone(String phone) async {
    var body = jsonEncode({'email': '${null}', 'phone': phone});
    var response = await http.post(
        Uri.parse("http://3.138.105.45/api/v1/logins/logindriver"),
        body: body,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    // ignore: avoid_print
    print(response.body);
    if (response.body == 'true' && response.statusCode == 200) {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }
}
