import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:timxe/screens/login/widgets/google_auth/google_sign_in.dart';
class GoogleButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: ElevatedButton.icon(
        onPressed: (){
          final provider= Provider.of<GoogleSignInProvider>(context ,listen: false);
          provider.googleLogin();
        },
        icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,),
        label: Text(
          'Tiếp tục với Google',
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          minimumSize: Size(double.infinity,50)
        ),
      ),
    );
  }
}