import 'dart:convert';

import 'package:http/http.dart' as http;

class UpdateBookingStatusApi{
  Future<bool> apiUpdateStatusBooking(int idBooking,int status) async {
  
    var body = jsonEncode({'id': idBooking,'status':status});
    var response = await http.put(
        Uri.parse("http://3.138.105.45/api/v1/booking/${idBooking}/${status}"),
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
}