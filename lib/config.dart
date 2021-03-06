import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryColor =Colors.greenAccent;
const kBackgroundColor=Colors.green;

class Config {
  static String host="http://3.138.105.45/";
 static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}