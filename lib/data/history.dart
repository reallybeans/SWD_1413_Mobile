// To parse this JSON data, do
//
//     final history = historyFromJson(jsonString);

import 'dart:convert';

List<History> historyFromJson(String str) =>
    List<History>.from(json.decode(str).map((x) => History.fromJson(x)));

String historyToJson(List<History> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class History {
  History({
    required this.id,
    required this.bookingDriverId,
    required this.customerId,
    required this.driverId,
    required this.customerName,
    required this.phoneCustomer,
    required this.mode,
    required this.price,
    required this.timeWait,
    required this.status,
    required this.date,
    required this.startDate,
    required this.description,
    required this.schedule,
  });

  int id;
  int bookingDriverId;
  dynamic customerId;
  int driverId;
  String customerName;
  String phoneCustomer;
  bool mode;
  int price;
  int timeWait;
  String status;
  DateTime date;
  DateTime startDate;
  String description;
  Schedule schedule;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        bookingDriverId: json["bookingDriverId"],
        customerId: json["customerId"],
        driverId: json["driverId"],
        customerName: json["customerName"],
        phoneCustomer: json["phoneCustomer"],
        mode: json["mode"],
        price: json["price"],
        timeWait: json["timeWait"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
        startDate: DateTime.parse(json["startDate"]),
        description: json["description"],
        schedule: Schedule.fromJson(json["schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingDriverId": bookingDriverId,
        "customerId": customerId,
        "driverId": driverId,
        "customerName": customerName,
        "phoneCustomer": phoneCustomer,
        "mode": mode,
        "price": price,
        "timeWait": timeWait,
        "status": status,
        "date": date.toIso8601String(),
        "startDate": startDate.toIso8601String(),
        "description": description,
        "schedule": schedule.toJson(),
      };
}

class Schedule {
  Schedule({
    required this.total,
    required this.address,
    required this.latlng,
  });

  int total;
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
    required this.listWaypoint,
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
