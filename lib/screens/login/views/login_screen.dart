import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/login_controller.dart';


class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.greenAccent[400],
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    // PhoneButton(),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 40,
                            color: Colors.white,
                          ),
                        ),
                        Text("OR", style: TextStyle(color: Colors.white)),
                        Expanded(
                            child: Divider(
                          height: 40,
                          color: Colors.white,
                        )),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          controller.login();
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                        ),
                        label: Text(
                          'Tiếp tục với Google',
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            minimumSize: Size(double.infinity, 50)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
