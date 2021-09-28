import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timxe/screens/logged/logged_screen.dart';
import 'package:timxe/screens/login/widgets/google_auth/google_sign_in.dart';

Future apiCheckLogin(BuildContext context)async{
      final user = FirebaseAuth.instance.currentUser!;
      var name = user.email;
      try {
        var future = await http
            .post(Uri.parse("https://reqres.in/api/login"),
                body: ({
                  'email': 'eve.holt@reqres.in',
                  'password': 'cityslicka',
                }))
            .then((response) {
          if (response.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đăng nhập thành công!')));
           Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoggedScreen()),
                        (route) => false);
          return true;
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tài khoản chưa được cấp phép!')));
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
            return false;
          }
        });
      } on FirebaseAuthException catch (e) {}
  }