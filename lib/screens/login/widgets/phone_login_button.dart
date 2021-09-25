import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PhoneButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: ElevatedButton.icon(
        onPressed: (){},
        icon: FaIcon(FontAwesomeIcons.phone,color: Colors.black,),
        label: Text(
          'Tiếp tục với số điện thoại',
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