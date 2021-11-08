import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timxe/routes/app_pages.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';

class StartView extends GetView<HomeController> {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.greenAccent[700],
        body:
            Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SvgPicture.asset("assets/icons/bottom.svg"),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 4 / 10,
              right: 0,
              left: 0,
              child: SvgPicture.asset("assets/icons/logo_welcome.svg"),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              right: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    color: Colors.greenAccent[700],
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    child: const Text(
                      'Bắt đầu',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 1 / 10,
              // left: 0,
              left: MediaQuery.of(context).size.height * 0.25 / 10,
                child: Text(
              'TimXe',
              style: GoogleFonts.pacifico(fontSize: 70,fontWeight: FontWeight.bold,),
            ))
          ],
        ));
  }
}
