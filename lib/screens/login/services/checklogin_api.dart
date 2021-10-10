import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timxe/config.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';

class apiService {
  final user = FirebaseAuth.instance.currentUser;
  String token = "";
  
  Future<bool> apiCheckLogin() async {
    user!.getIdTokenResult().then((value) => {
          token = value.token!,
          print("Token ne: " '${token}'),
        });

    var body = jsonEncode(
        {'email': user!.email, 'phone': '${null}', 'token': '${token}'});
    var response = await http.post(
        Uri.parse('${Config.host}' "api/v1/logins/logindriver"),
        body: body,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    print(response.body);
    if (response.body == 'true' && response.statusCode == 200)
      return Future<bool>.value(true);
    else {
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
    print(response.body);
    if (response.body == 'true' && response.statusCode == 200)
      return Future<bool>.value(true);
    else {
      return Future<bool>.value(false);
    }
  }
}
