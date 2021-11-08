// To parse this JSON data, do
//
//     final vehicle = vehicleFromJson(jsonString);

import 'dart:convert';

List<Vehicle> vehicleFromJson(String str) =>
    List<Vehicle>.from(json.decode(str).map((x) => Vehicle.fromJson(x)));

String vehicleToJson(List<Vehicle> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vehicle {
  Vehicle({
    required this.id,
    required this.driverName,
    required this.vehicleName,
    required this.licensePlate,
    required this.vehicleType,
    required this.status,
  });

  int id;
  String driverName;
  String vehicleName;
  String licensePlate;
  String vehicleType;
  String status;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["id"],
        driverName: json["driverName"],
        vehicleName: json["vehicleName"],
        licensePlate: json["licensePlate"],
        vehicleType: json["vehicleType"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "driverName": driverName,
        "vehicleName": vehicleName,
        "licensePlate": licensePlate,
        "vehicleType": vehicleType,
        "status": status,
      };
}
