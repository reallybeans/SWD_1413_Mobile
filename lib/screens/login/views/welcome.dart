import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';
import 'package:timxe/screens/login/views/nav_history_view.dart';
import 'package:timxe/screens/login/views/nav_info_view.dart';
import 'package:timxe/screens/login/views/nav_notification_view.dart';
import 'package:timxe/screens/login/views/nav_setting_view.dart';
import 'package:timxe/screens/login/views/nav_shedule_view.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var index = 0.obs;
    final iconItems = <Widget>[
      const Icon(
        Icons.schedule,
        size: 30,
      ),
      const Icon(
        Icons.notifications,
        size: 30,
      ),
      const Icon(
        Icons.history_outlined,
        size: 30,
      ),
  
      const Icon(
        Icons.person,
        size: 30,
      ),
    ];
    final views=[
      NavSheduleView(),
      NavNotifyView(),
      const NavHistoryView(),
      const NavInfoView(),
    ];
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.greenAccent[400],
        body: Obx(() =>views[index.value] ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.black)
          ),
          child: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),
              height: 60,
              index: index.value,
              items: iconItems,
              onTap:index,
              ),
              
        ));
  }
}
