import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/nav_notification_controller.dart';
import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';
import 'package:timxe/screens/login/views/detail_customer_view.dart';
import 'package:timxe/screens/login/views/detail_schedule.dart';

class NavNotifyView extends GetView<NavNotificationController> {
  WelcomeController welcomeController = Get.find<WelcomeController>();
  final NavSheduleController notifyController = Get.put(NavSheduleController());

  @override
  Widget build(BuildContext context) {
    return _buildListCustomers(context);
  }

  ListView _buildListCustomers(BuildContext context) {
    return ListView.builder(
      itemCount: notifyController.scheduleList.length,
      itemBuilder: (_, index) {
        return Card(
          child: ListTile(
            title: Text(
              notifyController.scheduleList[index].nameCustomer,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    'Số điện thoại: ${notifyController.scheduleList[index].phone}',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  Text(
                    'Ngày đón: ${notifyController.scheduleList[index].start}',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  Text(
                    'Tổng tiền: ${notifyController.scheduleList[index].price.toString()}',
                    style:
                        TextStyle(color: Colors.green.shade800, fontSize: 17),
                  ),
                ],
              ),
            ),
            leading: Image.asset(
              'assets/images/iconMoney.png',
              height: 60,
              width: 60,
            ),
            trailing: Icon(Icons.arrow_forward),
            onTap: () =>
                Get.to(CustomerDetails(notifyController.scheduleList[index])),
          ),
        );
      },
    );
  }
}
