import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_instance/src/extension_instance.dart';
import 'package:timelines/timelines.dart';
import 'package:timxe/data/history.dart';
import 'package:timxe/screens/login/controller/history_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryDetail extends StatelessWidget {
  final HistoryController historyController = Get.put(HistoryController());
  final History historyItem;
  HistoryDetail(this.historyItem, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // String appBarTitle = 'Thông tin chi tiết';

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
                    historyItem.customerName,
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
                        historyItem.phoneCustomer.toString(),
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
                        '${historyItem.startDate.day}' +
                            "/" +
                            '${historyItem.startDate.month}' +
                            "/" +
                            '${historyItem.startDate.year}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${historyItem.startDate.hour}' +
                            "h" +
                            '${historyItem.startDate.minute}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      // Text(
                      //   scheduleItem.startAt.toString(),
                      //   style: const TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 18,
                      //   ),
                      // ),
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
                          historyItem.schedule.address.origin.toString(),
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
                    children: [
                      Expanded(
                        child: FixedTimeline.tileBuilder(
                          builder: TimelineTileBuilder.connectedFromStyle(
                            contentsAlign: ContentsAlign.reverse,
                            oppositeContentsBuilder: (context, index) =>
                                Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  historyItem.schedule.address.waypoint[index]),
                            ),
                            contentsBuilder: (context, index) => Card(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton.icon(
                                    label: const Text(""),
                                    onPressed: () async {
                                      String googleUrl =
                                          'https://www.google.com/maps/search/?api=1&query=${historyItem.schedule.address.waypoint[index]}';
                                      if (await canLaunch(googleUrl)) {
                                        await launch(googleUrl);
                                      } else {
                                        throw 'Could not open the map.';
                                      }
                                    },
                                    icon:
                                        const Icon(Icons.location_on_outlined),
                                  )),
                            ),
                            connectorStyleBuilder: (context, index) =>
                                ConnectorStyle.solidLine,
                            indicatorStyleBuilder: (context, index) =>
                                IndicatorStyle.dot,
                            itemCount:
                                historyItem.schedule.address.waypoint.length,
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
                          historyItem.schedule.address.destination.toString(),
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
                        value: historyItem.mode,
                        onChanged: (bool) {},
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                  historyItem.mode
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
                      historyItem.mode
                          ? Row(
                              children: [
                                const Text(
                                  'Thời gian chờ: ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  historyItem.timeWait.toString(),
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
                        '${historyItem.price.toString()}' ' VNĐ',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  //    Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: Row(
                  //     children: [
                  //       ClipRRect(
                  //         borderRadius: BorderRadius.circular(17),
                  //         // ignore: deprecated_member_use
                  //         child: FlatButton(
                  //           padding: const EdgeInsets.symmetric(
                  //               vertical: 10, horizontal: 20),
                  //           color: Colors.greenAccent[700],
                  //           onPressed: () {
                  //            UpdateBookingStatusApi api=new UpdateBookingStatusApi();
                  //            //Status 2 là chấp nhận Cuốc
                  //            api.apiUpdateStatusBooking(historyItem.id,2);
                  //         //  Get.
                  //           },
                  //           child: const Text(
                  //             'Chấp nhận',
                  //             style:
                  //                 TextStyle(color: Colors.white, fontSize: 20),
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         width: 10,
                  //       ),
                  //       ClipRRect(
                  //         borderRadius: BorderRadius.circular(17),
                  //         // ignore: deprecated_member_use
                  //         child: FlatButton(
                  //           padding: const EdgeInsets.symmetric(
                  //               vertical: 10, horizontal: 20),
                  //           color: Colors.amber.shade300,
                  //           onPressed: () { UpdateBookingStatusApi api=new UpdateBookingStatusApi();
                  //            //Status 3 là chấp nhận Cuốc
                  //            api.apiUpdateStatusBooking(historyItem.id,3);
                  //            Get.offAndToNamed(Routes.WELCOME);
                  //            },
                  //           child: const Text(
                  //             'Từ chối',
                  //             style:
                  //                 TextStyle(color: Colors.white, fontSize: 20),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
