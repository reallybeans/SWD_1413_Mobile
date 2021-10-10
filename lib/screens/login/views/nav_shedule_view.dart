import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:timxe/data/schedulev1.dart';

import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';

import 'package:timxe/screens/login/widgets/schedule_container.dart';

import 'detail_schedule.dart';

class NavSheduleView extends GetView<NavSheduleController> {
  WelcomeController welcomeController = Get.find<WelcomeController>();
  final NavSheduleController userController = Get.put(NavSheduleController());

  get transitionType => null;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Container(
        //   width: double.infinity,
        //   height: 60,
        //   color: Colors.green[900],
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       CircleAvatar(
        //         radius: 20,
        //         backgroundColor: Colors.red,
        //         backgroundImage: NetworkImage(welcomeController.user.photoURL!),
        //       ),
        // //       Expanded(
        // //         child: Container(
        // //           padding: EdgeInsets.only(
        // //             left: 10,
        // //           ),
        // //           height: 40,
        // //           child: TypeAheadField<Schedule?>(
        // //             hideSuggestionsOnKeyboardHide: false,
        // //             textFieldConfiguration: TextFieldConfiguration(
        // //               decoration: InputDecoration(
        // //                 contentPadding: EdgeInsets.only(top: 5),
        // //                 prefixIcon: Icon(
        // //                   Icons.search,
        // //                   color: Colors.greenAccent[700],
        // //                 ),
        // //                 border: OutlineInputBorder(
        // //                   borderRadius: BorderRadius.circular(10.0),
        // //                 ),
        // //                 hintText: 'Search Username',
        // //                 filled: true,
        // //                 fillColor: Colors.white,
        // //               ),
        // //             ),
        // //             suggestionsCallback: ScheduleApi.getSchedule,
        // //             itemBuilder: (context, Schedule? suggestion) {
        // //               final schedule = suggestion!;

        // //               return ListTile(
        // //                 title: Container(child: Text(schedule.nameCustomer)),
        // //               );
        // //             },
        // //             noItemsFoundBuilder: (context) => Container(
        // //               height: size.height * 0.05,
        // //               child: Center(
        // //                 child: Text(
        // //                   'No Users Found.',
        // //                   style: TextStyle(fontSize: 24),
        // //                 ),
        // //               ),
        // //             ),
        // //             onSuggestionSelected: (Schedule? suggestion) {
        // //               final schedule = suggestion!;

        // //               ScaffoldMessenger.of(context)
        // //                 ..removeCurrentSnackBar()
        // //                 ..showSnackBar(SnackBar(
        // //                   content:
        // //                       Text('Selected user: ${schedule.nameCustomer}'),
        // //                 ));
        // //             },
        // //           ),
        // //         ),
        // //       ),
        //     ],
        //   ),
        // ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Lịch trình',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              )),
        ),

        Spacer(),
        Obx(
          () => CarouselSlider.builder(
            itemCount: controller.scheduleList.length,
            itemBuilder: (context, index, realIndex) => OpenContainer(
              transitionType: transitionType,
              transitionDuration: Duration(seconds: 1),
              openBuilder: (context, _) =>
                  ScheduleDetails(userController.scheduleList[index]),
              closedBuilder: (context, VoidCallback openContainer) =>
                  ScheduleContainer(userController.scheduleList[index]),
            ),
            options: CarouselOptions(
              height: size.height * 0.55,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
            ),
          ),
        ),
        Spacer(),
      ],
    ));
  }
}
