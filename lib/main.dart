import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timxe/screens/login/login_screen.dart';
import 'package:timxe/screens/login/widgets/google_auth/google_sign_in.dart';
import 'package:timxe/screens/login/widgets/splash_screen.dart';
import 'package:timxe/screens/start_screen.dart';
import 'package:timxe/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>GoogleSignInProvider(),
     child: MaterialApp(
      home: StartScreen(),
    )
    );
   
  }
}
