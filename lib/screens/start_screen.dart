import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timxe/screens/logged/logged_screen.dart';
import 'package:timxe/screens/login/login_screen.dart';
import 'package:timxe/screens/login/widgets/body.dart';
import 'package:timxe/screens/login/widgets/splash_screen.dart';
import 'package:timxe/screens/welcome/welcome_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.greenAccent[400],
      body: 
      StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if(snapshot.hasData){
            return SplashR();
          }else if(snapshot.hasError){
            return Center(child: Text('Some thing wrong!'),);
          }
          else {
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}
