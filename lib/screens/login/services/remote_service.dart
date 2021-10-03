import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:timxe/models/user.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<User>?> fetchUser() async {
    var response =
        await client.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      Map<String, dynamic> mapResponse = json.decode(jsonString);
      if (mapResponse["page"] == 2) {
        final users = mapResponse["data"].cast<Map<String, dynamic>>();
        final listOfUser = await users.map<User>((json) {
          return User.fromJson(json);
        }).toList();
      return listOfUser;
      }else{
      return [];
      }
    } else {
      throw Exception('');
    }
  }
}
