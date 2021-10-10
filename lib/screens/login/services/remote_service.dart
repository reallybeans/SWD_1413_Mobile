import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:timxe/models/user.dart';

class RemoteServices {
  static var client = http.Client();
   static Future<List<User>?> fetchUser() async {
    var response =
        await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users'),);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      Iterable list = json.decode(jsonString);
      final users = list.cast<Map<String, dynamic>>();
      final listOfUser = await users.map<User>((json) {
        return User.fromJson(json);
      }).toList();
      return listOfUser;
    } else {
      throw Exception('');
    }
  }
}
