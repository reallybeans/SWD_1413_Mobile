import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';
import 'package:timxe/screens/login/widgets/profile_menu.dart';

class NavInfoView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: Center(
            child: Text(
              'Profile',
              style: TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          )),
      body: Container(
        color: Colors.greenAccent[700],
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 32,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(controller.user.photoURL!),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              controller.user.displayName!,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            // Text(
            //   'Email: ' + controller.user.email!,
            //   style: TextStyle(color: Colors.black, fontSize: 16),
            // ),
            ProfileMenu(
              icon: "assets/icons/User Icon.svg",
              press: () {},
              text: 'Hồ sơ cá nhân',
            ),
            ProfileMenu(
              icon: "assets/icons/bell nofi.svg",
              press: () {},
              text: 'Thông báo',
            ),
            ProfileMenu(
              icon: "assets/icons/settings.svg",
              press: () {},
              text: 'Cài đặt',
            ),
            ProfileMenu(
              icon: 'assets/icons/question-mark.svg',
              press: () {},
              text: 'Hỗ trợ',
            ),
            ProfileMenu(
              icon: "assets/icons/exit.svg",
              press: () {
                controller.logout();
              },
              text: 'Đăng xuất',
            ),
          ],
        ),
      ),
    );
  }
}
