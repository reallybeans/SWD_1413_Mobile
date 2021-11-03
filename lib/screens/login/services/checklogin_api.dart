import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:timxe/data/driver.dart';


class ApiService {
  final user = FirebaseAuth.instance.currentUser;

  Future<Driver> apiCheckLogin(String token,String deviceId) async {
    Driver rs;
    // ignore: avoid_print
    print("CheckLogin_Api TokenGG: "+token);
    var body = jsonEncode({'token': token,'diviceId':deviceId});
    var response = await http.post(
        Uri.parse("http://3.138.105.45/api/v1/auth/login-driver"),
        body: body,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
      
    // ignore: avoid_print
    print("CheckLogin_Api Status_Code: "'$response.statusCode');
    if (response.statusCode == 200) {
      var jsonString = response.body;
    Map<String, dynamic> map = json.decode(jsonString);
    Map<String, dynamic> data = map["data"];
    rs= Driver.fromJson(data);
   return Future<Driver>.value(rs);
    }else
       // ignore: null_argument_to_non_null_type
       return Future<Driver>.value(null);
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
