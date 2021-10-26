import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';
import 'package:timxe/screens/login/widgets/schedule_container.dart';
import 'detail_schedule.dart';

// ignore: must_be_immutable
class NavSheduleView extends GetView<NavSheduleController> {
  WelcomeController welcomeController = Get.find<WelcomeController>();
  final NavSheduleController navScheduleController =
      Get.put(NavSheduleController());

  NavSheduleView({Key? key}) : super(key: key);

  get transitionType => null;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const transitionType = ContainerTransitionType.fade;
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 40,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Lịch trình',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              )),
        ),
        const Spacer(),
        Obx(
          () => CarouselSlider.builder(
            itemCount: controller.scheduleList.length,
            itemBuilder: (context, index, realIndex) => OpenContainer(
              openColor: Colors.transparent,
              closedColor: Colors.greenAccent.shade400,
              transitionType: transitionType,
              transitionDuration: const Duration(seconds: 1),
              openBuilder: (context, _) =>
                  ScheduleDetails(navScheduleController.scheduleList[index]),
              closedBuilder: (context, VoidCallback openContainer) =>
                  ScheduleContainer(navScheduleController.scheduleList[index]),
            ),
            options: CarouselOptions(
              height: size.height * 0.55,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
            ),
          ),
        ),
        const Spacer(),
      ],
    ));
  }
}
