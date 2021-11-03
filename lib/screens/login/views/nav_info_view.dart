import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';
import 'package:timxe/screens/login/views/history_view.dart';
import 'package:timxe/screens/login/views/nav_info_detail_view.dart';
import 'package:timxe/screens/login/widgets/profile_menu.dart';

class NavInfoView extends GetView<WelcomeController> {
  const NavInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green[900],
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black, fontSize: 16),
            textAlign: TextAlign.center,
          )),
      body: Container(
        color: Colors.greenAccent[700],
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(controller.user.photoURL!),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              controller.homeController.currentDriver.name,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 8,
            ),
            ProfileMenu(
              icon: Icon(
                Icons.person,
                color: Colors.orange.shade200,
              ),
              press: () {
                Get.to(const InfomationDetail());
              },
              text: 'Hồ sơ cá nhân',
            ),
            ProfileMenu(
              icon: Icon(
                Icons.schedule_rounded,
                color: Colors.orange.shade200,
              ),
              press: () => Get.to(HistoryView()),
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HistoryView()),
              // ),
              text: 'Lịch sử',
            ),
            ProfileMenu(
              icon: Icon(
                Icons.settings,
                color: Colors.orange.shade200,
              ),
              press: () {},
              text: 'Cài đặt',
            ),
            ProfileMenu(
              icon: Icon(
                Icons.headset_mic_outlined,
                color: Colors.orange.shade200,
              ),
              press: () {},
              text: 'Hỗ trợ',
            ),
            ProfileMenu(
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.orange.shade200,
              ),
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
