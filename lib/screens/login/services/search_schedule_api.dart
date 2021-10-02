import 'dart:convert';
import 'package:http/http.dart' as http;

class Schedule{
  final String nameCustomer;
  const Schedule({
    required this.nameCustomer,
  });
  static Schedule fromJson(Map<String,dynamic>json)=>Schedule(nameCustomer: json['name']);
}
class ScheduleApi{

  static Future<List<Schedule>> getSchedule(String query) async{
     final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List schedules = json.decode(response.body);

      return schedules.map((json) => Schedule.fromJson(json)).where((schedule) {
        final nameLower = schedule.nameCustomer.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}