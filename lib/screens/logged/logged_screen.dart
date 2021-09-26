import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:timxe/screens/login/login_screen.dart';
import 'package:timxe/screens/login/widgets/google_auth/google_sign_in.dart';

class LoggedScreen extends StatefulWidget {
  @override
  _LoggedScreen createState() => _LoggedScreen();
}

class _LoggedScreen extends State<LoggedScreen> {
  Future<bool?> showWaring(BuildContext context) async => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Do you want to exits'),
            actions: [
              ElevatedButton(
                child: Text('No'),
                onPressed: () => Navigator.pop(context,true),
              ),
               ElevatedButton(
                child: Text('Yes'),
                onPressed: () => exit(0),
              ),
            ],
          ));
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Logged'),
            centerTitle: true,
            actions: [
              TextButton(
                  onPressed: () {
                    final user = FirebaseAuth.instance.currentUser!;
                    print(user.email);
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.logout();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))
            ],
            backgroundColor: Colors.greenAccent[700],
          ),
          body: Container(
            color: Colors.green[50],
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
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Name: ' + user.displayName!,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Name: ' + user.email!,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          final shouldPop = await showWaring(context);
          return shouldPop??false;
        });
  }
}
