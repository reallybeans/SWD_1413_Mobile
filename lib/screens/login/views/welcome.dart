import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/binding/nav_notify_binding.dart';
import 'package:timxe/screens/login/binding/nav_shedule_binding.dart';
import 'package:timxe/screens/login/controller/nav_notification_controller.dart';
import 'package:timxe/screens/login/views/detail_customer_view_copy.dart';
import 'package:timxe/screens/login/views/nav_info_view.dart';
import 'package:timxe/screens/login/views/nav_shedule_view.dart';
import 'package:timxe/screens/login/views/nav_video_call_view.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavSheduleBinding().dependencies();
    NavNotifyBinding().dependencies();
    var index = 0.obs;
    final iconItems = <Widget>[
      const Icon(
        Icons.bookmark,
        size: 30,
      ),
      // const Icon(
      //   Icons.notifications,
      //   size: 30,
      // ),
      const Icon(
        Icons.message,
        size: 30,
      ),
      const Icon(
        Icons.person,
        size: 30,
      ),
    ];
    final views = [
      NavSheduleView(),
      // NavNotifyView(),
      const NavVideoCallView(),
      const NavInfoView(),
    ];
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.greenAccent[700],
        body: Obx(() {
          if (Get.find<NavNotificationController>().isNotEmptyList.value) {
            Future.delayed(
                Duration(seconds: 1),
                () => Get.to(CustomerDetails2(
                    Get.find<NavNotificationController>()
                        .bookingWaitProcessList
                        .value[0])));
          }
          return views[index.value];
        }),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.black)),
          child: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            height: 60,
            index: index.value,
            items: iconItems,
            onTap: index,
          ),
        ));
  }
}
