import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/history_controller.dart';
import 'package:timxe/screens/login/views/detail_history_view.dart';

class HistoryView extends GetView<HistoryController> {
  HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final HistoryController historyController = Get.put(HistoryController());
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green[900],
            title: const Text(
              'Lịch sử',
              style: TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center,
            )),
        backgroundColor: Colors.greenAccent[400],
        body: Obx(
          () {
            if (controller.isLoading.value) {
              // return SchedulePlash();
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.yellowAccent,
                ),
              );
            } else {
              return _buildListCustomers(context);
            }
          },
        ));
  }

  ListView _buildListCustomers(BuildContext context) {
    return ListView.builder(
      itemCount: controller.historyList.length,
      itemBuilder: (_, index) {
        return Card(
          child: ListTile(
            title: Text(
              controller.historyList[index].customerName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Số điện thoại: ${controller.historyList[index].phoneCustomer}',
                      style: const TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ngày đón: ${controller.historyList[index].startDate.day}/${controller.historyList[index].startDate.month}/${controller.historyList[index].startDate.year}',
                      style: const TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    controller.historyList[index].status == "Cancel"
                        ? const Text('')
                        : Text(
                            'Tổng tiền: ${controller.historyList[index].price.toString()}',
                            style: TextStyle(
                                color: Colors.green.shade800, fontSize: 17),
                          ),
                  ],
                ),
              ],
            ),
            leading: controller.historyList[index].status == "Cancel"
                ? const Icon(
                    Icons.cancel_outlined,
                    color: Colors.red,
                    size: 50,
                  )
                : const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 50,
                  ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () =>
                Get.to(HistoryDetail(controller.historyList[index])),
          ),
        );
      },
    );
  }
}
