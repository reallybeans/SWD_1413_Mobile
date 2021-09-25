import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timxe/common/rounded_button.dart';
import 'package:timxe/screens/welcome/widgets/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Spacer(),
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: Text(
          //     "TimXe",
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: RoundedButton(
                text: "Bắt Đầu",
                press: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
