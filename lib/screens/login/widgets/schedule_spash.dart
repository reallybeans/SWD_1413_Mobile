import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:lottie/lottie.dart";

class SchedulePlash extends StatelessWidget {
  const SchedulePlash({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
             Text("Tiếc quá chưa có cuốc mới. Cố đợi nhé",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
             SizedBox(
               width: 300,
               height: 300,
               child: Lottie.network("https://assets8.lottiefiles.com/packages/lf20_pj37lM.json")),
           Spacer(),
        ],
      ),
      
    );
  }
}