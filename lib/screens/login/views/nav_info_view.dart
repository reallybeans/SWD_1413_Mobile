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
              radius: 50,
              backgroundImage: NetworkImage(controller.user.photoURL!),
            ),
            SizedBox(
              height: 12,
            ),
            Text (
              controller.user.displayName!,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            // Text(
            //   'Email: ' + controller.user.email!,
            //   style: TextStyle(color: Colors.black, fontSize: 16),
            // ),
            ProfileMenu(
              icon: Icon(Icons.person,color: Colors.orange.shade200,),
              press: () {},
              text: 'Hồ sơ cá nhân',
            ),
            ProfileMenu(
        icon: Icon(Icons.notifications,color: Colors.orange.shade200,),
              press: () {},
              text: 'Thông báo',
            ),
            ProfileMenu(
         icon: Icon(Icons.settings,color: Colors.orange.shade200,),
              press: () {},
              text: 'Cài đặt',
            ),
            ProfileMenu(
        icon: Icon(Icons.headset_mic_outlined,color: Colors.orange.shade200,),
              press: () {},
              text: 'Hỗ trợ',
            ),
            ProfileMenu(
         icon: Icon(Icons.logout_outlined,color: Colors.orange.shade200,),
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
