import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:timxe/data/schedule.dart';
import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';

class CustomerDetails extends StatelessWidget {
  final NavSheduleController navSheduleController =
      Get.put(NavSheduleController());
  final Schedule scheduleItem;
  CustomerDetails(this.scheduleItem, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final scheduleItem = navSheduleController.scheduleList[0];
    String appBarTitle = 'Thông tin chi tiết';

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: Text(appBarTitle),
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
                        scheduleItem.phone.toString(),
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
                      // ignore: prefer_const_constructors
                      Expanded(
                          child: const Divider(
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
                        scheduleItem.start,
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
                      // ignore: prefer_const_constructors
                      Expanded(
                          // ignore: prefer_const_constructors
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
                      // ignore: prefer_const_constructors
                      Expanded(
                          child: const Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  // Điểm dừng chân
                  const Text(
                    'Điểm dừng chân: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Expanded(
                          child: const Divider(
                        height: 40,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              for (var i = 0;
                                  i <
                                      scheduleItem
                                          .schedule.address.waypoint.length;
                                  i++)
                                Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    '${i + 1} '
                                    '${scheduleItem.schedule.address.waypoint[i]}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                        '2 chiều: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      if (scheduleItem.mode ? true : false)
                        const Text(
                          "Có",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        )
                      else
                        const Text(
                          "Không",
                          style: TextStyle(
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
                  // Thời gian chờ
                  Row(
                    children: [
                      const Text(
                        'Thời gian chờ: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            color: Colors.greenAccent[700],
                            onPressed: () {},
                            child: const Text(
                              'Chấp nhận',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            color: Colors.amber.shade300,
                            onPressed: () {},
                            child: const Text(
                              'Từ chối',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
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
