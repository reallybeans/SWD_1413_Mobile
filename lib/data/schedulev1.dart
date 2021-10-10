// To parse this JSON data, do
//
//     final schedule = scheduleFromJson(jsonString);

import 'dart:convert';

List<Schedule> scheduleFromJson(String str) =>
    List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

String scheduleToJson(List<Schedule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schedule {
  Schedule({
    required this.id,
    required this.nameCustomer,
    required this.phone,
    required this.start,
    required this.timeWait,
    required this.mode,
    required this.price,
    required this.status,
    required this.schedule,
  });

  int id;
  String nameCustomer;
  String phone;
  String start;
  int timeWait;
  bool mode;
  int price;
  int status;
  ScheduleClass schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        nameCustomer: json["nameCustomer"],
        phone: json["phone"],
        start: json["start"],
        timeWait: json["timeWait"],
        mode: json["mode"],
        price: json["price"],
        status: json["status"],
        schedule: ScheduleClass.fromJson(json["schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameCustomer": nameCustomer,
        "phone": phone,
        "start": start,
        "timeWait": timeWait,
        "mode": mode,
        "price": price,
        "status": status,
        "schedule": schedule.toJson(),
      };
}

class ScheduleClass {
  ScheduleClass({
    required this.total,
    required this.address,
    required this.latlng,
  });

  int total;
  Address address;
  Address latlng;

  factory ScheduleClass.fromJson(Map<String, dynamic> json) => ScheduleClass(
        total: json["total"],
        address: Address.fromJson(json["address"]),
        latlng: Address.fromJson(json["latlng"]),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "address": address.toJson(),
        "latlng": latlng.toJson(),
      };
}

class Address {
  Address({
    required this.origin,
    required this.destination,
    required this.waypoint,
  });

  String origin;
  String destination;
  List<String> waypoint;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        origin: json["origin"],
        destination: json["destination"],
        waypoint: List<String>.from(json["waypoint"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "origin": origin,
        "destination": destination,
        "waypoint": List<dynamic>.from(waypoint.map((x) => x)),
      };
}
