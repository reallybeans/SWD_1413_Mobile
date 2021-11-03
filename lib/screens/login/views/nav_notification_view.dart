import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/nav_notification_controller.dart';
import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';
import 'package:timxe/screens/login/views/detail_customer_view.dart';

class NavNotifyView extends GetView<NavNotificationController> {
  WelcomeController welcomeController = Get.find<WelcomeController>();
  final NavNotificationController notifyController = Get.put(NavNotificationController());

  @override
  Widget build(BuildContext context) {
    return _buildListCustomers(context);
  }

  ListView _buildListCustomers(BuildContext context) {
    return ListView.builder(
      itemCount: notifyController.bookingWaitProcessList.length,
      itemBuilder: (_, index) {
        return Card(
          child: ListTile(
            title: Text(
              notifyController.bookingWaitProcessList[index].nameCustomer,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    'Số điện thoại: ${notifyController.bookingWaitProcessList[index].phoneCustomer}',
                    style: const TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  Text(
                    'Ngày đón: ${notifyController.bookingWaitProcessList[index].startAt.toString()}',
                    style: const TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  Text(
                    'Tổng tiền: ${notifyController.bookingWaitProcessList[index].priceBooking.toString()}',
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
            trailing: const Icon(Icons.arrow_forward),
            onTap: () =>
                Get.to(CustomerDetails(notifyController.bookingWaitProcessList[index])),
          ),
        );
      },
    );
  }
}
