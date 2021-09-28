import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/routes/app_pages.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';
import 'package:timxe/screens/login/widgets/background.dart';

class StartView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.greenAccent[400],
      body: Background(
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
                child: RaisedButton(
                  child: Text('Bắt Đầu'),
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
