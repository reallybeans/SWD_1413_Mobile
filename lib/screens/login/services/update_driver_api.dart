import 'dart:convert';

import 'package:http/http.dart' as http;
class UpdateDriverApi {

    Future<bool> updateStatusDriver(int idDriver,String status) async {
    var body = jsonEncode({'id': idDriver,'status':status});
    var response = await http.put(
        Uri.parse("http://3.138.105.45/api/v1/drivers/update-status"),body:body,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    print('updateStatusDriver API: '+'${response.statusCode}');
    if (response.statusCode == 200) {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
      //  return Future<bool>.value(true);
  }
}