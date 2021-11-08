import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:timxe/screens/login/controller/history_controller.dart';

// ignore: must_be_immutable
class ManageVehiclePage extends GetView<HistoryController> {
  ManageVehiclePage({Key? key}) : super(key: key);
  var tmp = false.obs;
  @override
  Widget build(BuildContext context) {
    print('ManageVehiclePage');
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green[900],
          title: const Text(
            'Quản lý xe',
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          )),
      backgroundColor: Colors.greenAccent[700],
      body: _buildListCustomers(context),
    );
  }

  ListView _buildListCustomers(BuildContext context) {
    RxList<bool> _switchValues =
        RxList.generate(controller.historyList.length, (_) => false);
    return ListView.builder(
      itemCount: controller.historyList.length,
      itemBuilder: (_, index) {
        _switchValues[index] = controller.historyList[index].mode;
        return Obx(
          () => (Column(
            children: [
              ListTileSwitch(
                switchType: SwitchType.custom,
                title: Text(
                  controller.historyList[index].customerName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
                value: _switchValues[index],
                onChanged: (value) {
                  try {
                    _switchValues[index] = value;
                  } finally {
                    controller.historyList[index].mode = _switchValues[index];
                  }

                  print('${controller.historyList[index].mode} fsdf');
                },
              ),
              // CupertinoSwitch(
              //   trackColor: Colors.black,
              //   value: tmp.value,
              //   onChanged: (value) {
              //     tmp.value = value;
              //     print('${controller.switchValue.value} fsdf');
              //   },
              // ),
            ],
          )),
        );
      },
    );
  }
}
