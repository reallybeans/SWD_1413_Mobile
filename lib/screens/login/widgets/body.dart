import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timxe/screens/login/widgets/google_login_button.dart';
import 'package:timxe/screens/login/widgets/phone_login_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      height: size.height,
      width: double.infinity,
      child: Column(
        children: [
          Spacer(),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  PhoneButton(),
                  Row(
                    children: [
                      Expanded(child: Divider(height: 40,color: Colors.white,),),
                      Text("OR",style:TextStyle(color: Colors.white)),
                      Expanded(child: Divider(height: 40,color: Colors.white,)),
                    ],
                  ),
                  GoogleButtonWidget(),
                  SizedBox(height: 20,)
                ],
              ))
        ],
      ),
    );
  }
}
