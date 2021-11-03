// To parse this JSON data, do
//
//     final driver = driverFromJson(jsonString);

import 'dart:convert';

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));

String driverToJson(Driver data) => json.encode(data.toJson());

class Driver {
  Driver({
    required this.accessToken,
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
    required this.img,
    required this.cardId,
    required this.status,
  });
  

  String accessToken;
  int id;
  String name;
  String phone;
  String email;
  String role;
  String img;
  String cardId;
  String status;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        accessToken: json["accessToken"],
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        role: json["role"],
        img: json["img"],
        cardId: json["cardId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "role": role,
        "img": img,
        "cardId": cardId,
        "status": status,
      };
}
