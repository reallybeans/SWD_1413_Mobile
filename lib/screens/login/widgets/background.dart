import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: SvgPicture.asset("assets/icons/bottom.svg"),
          ),
          Positioned(
            top: 200,
            child: SvgPicture.asset("assets/icons/logo_welcome.svg"),
          ),
          child,
        ],
      ),
    );
  }
}
