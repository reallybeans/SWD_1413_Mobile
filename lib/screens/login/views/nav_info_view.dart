import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';

class NavInfoView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent[700],
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Profile',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(
            height: 32,
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(controller.user.photoURL!),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Name: ' + controller.user.displayName!,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Email: ' + controller.user.email!,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: Colors.white,
                onPressed: () {
                  controller.logout();
                },
                child: Text(
                  'logout',
                  style: TextStyle(color: Colors.greenAccent[400]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
