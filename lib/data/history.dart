// To parse this JSON data, do
//
//     final History = HistoryFromJson(jsonString);

import 'dart:convert';

List<History> historyFromJson(String str) =>
    List<History>.from(json.decode(str).map((x) => History.fromJson(x)));

String historyToJson(List<History> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class History {
  History({
    required this.id,
    required this.customerName,
    required this.phoneCustomer,
    required this.mode,
    required this.price,
    required this.timeWait,
    required this.status,
    required this.date,
    required this.startDate,
    required this.schedule,
  });

  int id;
  String customerName;
  String phoneCustomer;
  bool mode;
  int price;
  int timeWait;
  String status;
  DateTime date;
  DateTime startDate;
  Schedule schedule;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        customerName: json["customerName"],
        phoneCustomer: json["phoneCustomer"],
        mode: json["mode"],
        price: json["price"],
        timeWait: json["timeWait"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
        startDate: DateTime.parse(json["startDate"]),
        schedule: Schedule.fromJson(json["schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customerName": customerName,
        "phoneCustomer": phoneCustomer,
        "mode": mode,
        "price": price,
        "timeWait": timeWait,
        "status": status,
        "date": date.toIso8601String(),
        "startDate": startDate.toIso8601String(),
        "schedule": schedule.toJson(),
      };
}

class Schedule {
  Schedule({
    this.total,
    required this.address,
    required this.latlng,
  });

  dynamic total;
  Address address;
  Latlng latlng;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        total: json["total"],
        address: Address.fromJson(json["address"]),
        latlng: Latlng.fromJson(json["latlng"]),
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

class Latlng {
  Latlng({
    required this.origin,
    required this.destination,
    required this.waypoint,
    this.listWaypoint,
  });

  String origin;
  String destination;
  String waypoint;
  dynamic listWaypoint;

  factory Latlng.fromJson(Map<String, dynamic> json) => Latlng(
        origin: json["origin"],
        destination: json["destination"],
        waypoint: json["waypoint"],
        listWaypoint: json["listWaypoint"],
      );

  Map<String, dynamic> toJson() => {
        "origin": origin,
        "destination": destination,
        "waypoint": waypoint,
        "listWaypoint": listWaypoint,
      };
}
