import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:timelines/timelines.dart';
import 'package:timxe/data/booking.dart';
import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';
import 'package:timxe/screens/login/controller/new_booking_controller.dart';
import 'package:timxe/screens/login/services/get_schedule_api.dart';
import 'package:timxe/screens/login/services/update_booking_status_api.dart';

class CustomerDetails2 extends StatelessWidget {
  final Booking scheduleItem;

  const CustomerDetails2(this.scheduleItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var countdown = 30.obs;
    var isCancel=false.obs;
    Get.delete<NewBookingController>();
  Timer.periodic(
        Duration(seconds: 1),
        (Timer t) async => {
          isCancel(false),
              if (countdown == 0)
                {
                  // ignore: avoid_print
                  print('time out'),
                  await UpdateBookingStatusApi()
                      .apiUpdateStatusBooking(scheduleItem.id, 4),
                  t.cancel(),
                  Get.back()
                }
              else
                {
                  //check bên kia hủy thì ngắt
                  isCancel.value=await GetScheduleApi.checkCustomerCancelBooking("${scheduleItem.code}"),
                  if(isCancel.value){
                    // ignore: avoid_print
                    print('Hủy Cuốc'),
                    // Get.back(),
                    t.cancel(),
                     Get.back()
                  },
                  // ignore: avoid_print
                  // print('time count'),
                  countdown.value--,
                }
            });
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.greenAccent.shade400,
            body: Stack(children: [
              Positioned(
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  ' ' + scheduleItem.nameCustomer,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        color: Colors.black,
                                        fontSize: 30,
                                      ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text(
                                      ' Ngày đón: ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${scheduleItem.startAt.day}' +
                                          "/" +
                                          '${scheduleItem.startAt.month}' +
                                          "/" +
                                          '${scheduleItem.startAt.year}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Thời gian',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          ' ${scheduleItem.startAt.hour}' +
                                              "h" +
                                              '${scheduleItem.startAt.minute}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '${scheduleItem.priceBooking.toString()}'
                                  ' VNĐ',
                                  style: TextStyle(
                                      color: Colors.greenAccent[700],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),

                                const SizedBox(height: 10),
                             
                              ],
                            ),
                          ),

                          //Ngày đón

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
                                  scheduleItem.schedule.address.origin
                                      .toString(),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: FixedTimeline.tileBuilder(
                                  builder:
                                      TimelineTileBuilder.connectedFromStyle(
                                    firstConnectorStyle:
                                        ConnectorStyle.transparent,
                                    lastConnectorStyle:
                                        ConnectorStyle.transparent,
                                    contentsAlign: ContentsAlign.alternating,
                                    oppositeContentsBuilder: (context, index) =>
                                        Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(scheduleItem
                                          .schedule.address.waypoint[index]),
                                    ),
                                    contentsBuilder: (context, index) =>
                                        (Icon(Icons.location_on_outlined)),
                                    connectorStyleBuilder: (context, index) =>
                                        ConnectorStyle.solidLine,
                                    itemCount: scheduleItem
                                        .schedule.address.waypoint.length,
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
                                  scheduleItem.schedule.address.destination
                                      .toString(),
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
                           Row(
                            children: [
                              const Text(
                                'Loại xe: ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Text(
                                  "${scheduleItem.typeVehicle}"" chỗ"
                                     ,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
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

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 1 / 10,
                          )
                          // Align(
                          //   alignment: Alignment.bottomRight,
                          //   child:
                          // )
                        ]),
                  )
                ]),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Row(
                  children: [
                    Spacer(),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        onPressed: () async {
                          // Get.find<NavNotificationController>().isNotEmptyList(false);
                          await UpdateBookingStatusApi()
                              .apiUpdateStatusBooking(scheduleItem.id, 4);
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        color: Colors.greenAccent[700],
                        onPressed: () async {
                          //Status 2 là chấp nhận Cuốc
                          await UpdateBookingStatusApi()
                              .apiUpdateStatusBooking(scheduleItem.id, 2);
                          Get.find<NavSheduleController>().fetchSchedule();
                          Get.back();
                        },
                        child: Row(
                          children: [
                            const Text(
                              'Chấp nhận',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                              child: Obx(() => Text('${countdown.value}')),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
