// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

List<Booking> bookingFromJson(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingToJson(List<Booking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Booking {
  Booking({
    required this.id,
    required this.nameCustomer,
    required this.phoneCustomer,
    required this.status,
    required this.startAt,
    required this.timeWait,
    required this.mode,
    required this.priceBooking,
    required this.schedule,
  });

  int id;
  String nameCustomer;
  String phoneCustomer;
  int status;
  DateTime startAt;
  int timeWait;
  bool mode;
  int priceBooking;
  Schedule schedule;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        nameCustomer: json["nameCustomer"],
        phoneCustomer: json["phoneCustomer"],
        status: json["status"],
        startAt: DateTime.parse(json["startAt"]),
        timeWait: json["timeWait"],
        mode: json["mode"],
        priceBooking: json["priceBooking"],
        schedule: Schedule.fromJson(json["schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameCustomer": nameCustomer,
        "phoneCustomer": phoneCustomer,
        "status": status,
        "startAt": startAt.toIso8601String(),
        "timeWait": timeWait,
        "mode": mode,
        "priceBooking": priceBooking,
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
