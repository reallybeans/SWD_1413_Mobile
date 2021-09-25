import 'package:flutter/material.dart';
import 'package:timxe/screens/login/login_screen.dart';
import 'package:timxe/screens/login/widgets/phone_auth/sign_in_phonenum.dart';
import 'package:timxe/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: LoginByPhone(),

    );
  }
}
