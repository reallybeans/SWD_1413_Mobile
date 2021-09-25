import 'package:flutter/material.dart';
import 'package:timxe/screens/login/widgets/body.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0x14bf61),
        body: Body(),
        ),
    );
  }
}