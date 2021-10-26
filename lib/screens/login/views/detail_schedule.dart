import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:timelines/timelines.dart';
import 'package:timxe/data/schedule.dart';
import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';
import 'package:timxe/screens/login/widgets/schedule_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleDetails extends StatelessWidget {
  final NavSheduleController navSheduleController =
      Get.put(NavSheduleController());
  final Schedule scheduleItem;
  ScheduleDetails(this.scheduleItem);
  @override
  Widget build(BuildContext context) {
    // final scheduleItem = navSheduleController.scheduleList[0];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: const Text('Thông tin chi tiết'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    scheduleItem.nameCustomer,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                  ),
                  SizedBox(height: 10),
                  // SDT
                  Row(
                    children: [
                      Text(
                        'Số điện thoại: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        scheduleItem.phone.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  //Ngày đón
                  Row(
                    children: [
                      Text(
                        'Ngày đón: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        scheduleItem.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  // Điểm đón
                  Row(
                    children: [
                      Text(
                        'Điểm đón: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          scheduleItem.schedule.address.origin.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  // Điểm dừng chân
                  Row(
                    children: [
                     
                      Expanded(
                        child: FixedTimeline.tileBuilder(
                          builder: TimelineTileBuilder.connectedFromStyle(
                            contentsAlign: ContentsAlign.reverse,
                            oppositeContentsBuilder: (context, index) =>
                                Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  '${scheduleItem.schedule.address.waypoint[index]}'),
                            ),
                            contentsBuilder: (context, index) => Card(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton.icon(
                                    label: Text(""),
                                    onPressed: () async {
                                      String googleUrl =
                                          'https://www.google.com/maps/search/?api=1&query=${scheduleItem.schedule.address.waypoint[index]}';
                                      if (await canLaunch(googleUrl)) {
                                        await launch(googleUrl);
                                      } else {
                                        throw 'Could not open the map.';
                                      }
                                    },
                                    icon: Icon(Icons.location_on_outlined),
                                  )),
                            ),
                            connectorStyleBuilder: (context, index) =>
                                ConnectorStyle.solidLine,
                            indicatorStyleBuilder: (context, index) =>
                                IndicatorStyle.dot,
                            itemCount:
                                scheduleItem.schedule.address.waypoint.length,
                          ),
                        ),
                      ),
                      // Expanded(
                      //   // Text(
                      //   //   schedule.schedule.address.waypoint.forEach((element) {wa}),
                      //   //   style: TextStyle(
                      //   //     color: Colors.black,
                      //   //     fontSize: 18,
                      //   //   ),
                      //   // ),
                      //   child: Column(
                      //     children: [
                      //       for (var i = 0;
                      //           i <
                      //               scheduleItem
                      //                   .schedule.address.waypoint.length;
                      //           i++)
                      //         Container(
                      //           margin: EdgeInsets.only(bottom: 8),
                      //           child: Text(
                      //             '${i + 1} '
                      //             '${scheduleItem.schedule.address.waypoint[i]}',
                      //             style: TextStyle(
                      //               color: Colors.black,
                      //               fontSize: 18,
                      //             ),
                      //           ),
                      //         ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  // điểm đến
                  Row(
                    children: [
                      Text(
                        'Điểm đến: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          scheduleItem.schedule.address.destination.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  // 2 chiều
                  Row(
                    children: [
                      Text(
                        'Khứ hồi: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                        value: scheduleItem.mode,
                        onChanged: (bool) {},
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  // Thời gian chờ
                  Row(
                    children: [
                      Text(
                        'Thời gian chờ: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        scheduleItem.timeWait.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        " Ngày",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  // Tổng giá chuyến đi
                  Row(
                    children: [
                      Text(
                        'Tổng giá chuyến đi: ',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '${scheduleItem.price.toString()}' ' VNĐ',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
