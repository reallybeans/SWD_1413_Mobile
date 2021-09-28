import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class apiService {
  static Future<bool> apiCheckLogin() async {
  var response = await http.post(Uri.parse("https://reqres.in/api/login"),
      body: ({
        'email': 'eve.holt@reqres.in',
        'password': 'cityslicka',
      }));
  if (response.statusCode == 200)
    return Future<bool>.value(true);
  else {
    return Future<bool>.value(false);
  }
  }
}


