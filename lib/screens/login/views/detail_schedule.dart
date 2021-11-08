import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:timelines/timelines.dart';
import 'package:timxe/config.dart';
import 'package:timxe/data/booking.dart';
import 'package:timxe/screens/login/controller/nav_notification_controller.dart';

import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';
import 'package:timxe/screens/login/services/checklogin_api.dart';
import 'package:timxe/screens/login/services/update_booking_status_api.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleDetails extends StatelessWidget {
  final NavSheduleController navSheduleController =
      Get.put(NavSheduleController());
  final Booking scheduleItem;
  ScheduleDetails(this.scheduleItem, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 10),
                  // SDT
                  Row(
                    children: [
                      const Text(
                        'Số điện thoại: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        scheduleItem.phoneCustomer.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Expanded(
                          child: Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  //Ngày đón
                  Row(
                    children: [
                      const Text(
                        'Ngày đón: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${scheduleItem.startAt.day}' +
                            "/" +
                            '${scheduleItem.startAt.month}' +
                            "/" +
                            '${scheduleItem.startAt.year}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '${scheduleItem.startAt.hour}' +
                            "h" +
                            '${scheduleItem.startAt.minute}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Expanded(
                          child: Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  // Điểm đón
                  Row(
                    children: [
                      const Text(
                        'Điểm đón: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          scheduleItem.schedule.address.origin.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Expanded(
                          child: Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  // Điểm dừng chân
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FixedTimeline.tileBuilder(
                          builder: TimelineTileBuilder.connectedFromStyle(
                            contentsAlign: ContentsAlign.alternating,
                            firstConnectorStyle: ConnectorStyle.transparent,
                            lastConnectorStyle: ConnectorStyle.transparent,
                            oppositeContentsBuilder: (context, index) =>
                                Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(scheduleItem
                                  .schedule.address.waypoint[index]),
                            ),
                            contentsBuilder: (context, index) => Card(
                                // child: Padding(
                                // padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                              // disabledColor: true,
                              onPressed: () async {
                                String googleUrl =
                                    'https://www.google.com/maps/search/?api=1&query=${scheduleItem.schedule.address.waypoint[index]}';
                                if (await canLaunch(googleUrl)) {
                                  await launch(googleUrl);
                                } else {
                                  throw 'Could not open the map.';
                                }
                              },
                              icon: const Icon(Icons.location_on_outlined),
                            )
                                // ),
                                ),
                            connectorStyleBuilder: (context, index) =>
                                ConnectorStyle.solidLine,
                            // indicatorStyleBuilder: (context, index) =>
                            //     IndicatorStyle.dot,
                            itemCount:
                                scheduleItem.schedule.address.waypoint.length,
                            // firstConnectorStyle: Conn
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQueryData().size.width * 1,
                      )
                    ],
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Expanded(
                          child: Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  // điểm đến
                  Row(
                    children: [
                      const Text(
                        'Điểm đến: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          scheduleItem.schedule.address.destination.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Expanded(
                          child: Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  // 2 chiều
                  Row(
                    children: [
                      const Text(
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
                  scheduleItem.mode
                      ? Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Expanded(
                                child: Divider(
                              height: 40,
                              color: Colors.black,
                            )),
                          ],
                        )
                      :
                      // Thời gian chờ
                      scheduleItem.mode
                          ? Row(
                              children: [
                                const Text(
                                  'Thời gian chờ: ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  scheduleItem.timeWait.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                const Text(
                                  " Ngày",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            )
                          : Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Expanded(
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
                        '${scheduleItem.priceBooking.toString()}' ' VNĐ',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      await UpdateBookingStatusApi()
                          .apiUpdateStatusBooking(scheduleItem.id, 3);
                      Get.find<NavSheduleController>().fetchSchedule();
                      Get.find<NavNotificationController>()
                          .fecthBookingWaitProcess();
                      Get.back();
                    },
                    child: Text("Hoàn thành"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
