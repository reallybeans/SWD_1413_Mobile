import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/binding/nav_notify_binding.dart';
import 'package:timxe/screens/login/controller/nav_notification_controller.dart';
import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';
import 'package:timxe/screens/login/views/detail_customer_view.dart';
import 'package:timxe/screens/login/widgets/schedule_spash.dart';

class NavNotifyView extends GetView<NavNotificationController> {

  //  NavNotificationController navNotificationController=Get.put(NavNotificationController());
  @override
  Widget build(BuildContext context) {
    NavNotifyBinding().dependencies();
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade400,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
              child: CircularProgressIndicator(
                color: Colors.yellowAccent,
              ),
            );
        }
        if(controller.isNotEmptyList.value){
          return _buildListCustomers(context);
        }else{
          return Center(child: SchedulePlash(),);
        }
      }),
    );
  }

  ListView _buildListCustomers(BuildContext context) {
    return ListView.builder(
      itemCount: controller.bookingWaitProcessList.value.length,
      itemBuilder: (_, index) {
        return Obx(() => Card(
              child: ListTile(
                title: Text(
                  controller.bookingWaitProcessList[index].nameCustomer,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text(
                        'Số điện thoại: ${controller.bookingWaitProcessList[index].phoneCustomer}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        'Ngày đón: ${controller.bookingWaitProcessList[index].startAt.toString()}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        'Tổng tiền: ${controller.bookingWaitProcessList[index].priceBooking.toString()}',
                        style: TextStyle(
                            color: Colors.green.shade800, fontSize: 17),
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
                onTap: () => Get.to(
                    CustomerDetails(controller.bookingWaitProcessList[index])),
              ),
            ));
      },
    );
  }
}
