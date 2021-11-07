import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/binding/nav_shedule_binding.dart';
import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';
import 'package:timxe/screens/login/widgets/schedule_container.dart';
import 'package:timxe/screens/login/widgets/schedule_spash.dart';
import 'detail_schedule.dart';

// ignore: must_be_immutable
class NavSheduleView extends GetView<NavSheduleController> {
  // WelcomeController welcomeController = Get.find<WelcomeController>();
  NavSheduleView({Key? key}) : super(key: key);
  get transitionType => null;
  var tmp = false.obs;
  var _online = 'Hoạt động';
  var _off = 'Ngoại tuyến';
  var status = 'Ngoại tuyến';
  @override
  Widget build(BuildContext context) {
    NavSheduleBinding().dependencies();
    Size size = MediaQuery.of(context).size;
    const transitionType = ContainerTransitionType.fade;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(color: Colors.green.shade900),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  CupertinoSwitch(
                    trackColor: Colors.black,
                    value: tmp.value,
                    onChanged: (value) {
                      if (tmp.value) {
                        status = _off;
                      } else {
                        status = _online;
                      }

                      tmp.value = value;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
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
        Obx(() {
          if (controller.isLoading.value) {
            // return SchedulePlash();
            return Center(
              child: CircularProgressIndicator(
                color: Colors.yellowAccent,
              ),
            );
          } else {
            return CarouselSlider.builder(
              itemCount: controller.scheduleList.length,
              itemBuilder: (context, index, realIndex) => OpenContainer(
                openColor: Colors.transparent,
                closedColor: Colors.greenAccent.shade400,
                transitionType: transitionType,
                transitionDuration: const Duration(seconds: 1),
                openBuilder: (context, _) =>
                    ScheduleDetails(controller.scheduleList[index]),
                closedBuilder: (context, VoidCallback openContainer) =>
                    ScheduleContainer(controller.scheduleList[index]),
              ),
              options: CarouselOptions(
                height: size.height * 0.7,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
              ),
            );
          }
        }),
        const Spacer(),
      ],
    );
  }
}
