import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:timxe/screens/login/binding/manage_vehicle_binding.dart';
import 'package:timxe/screens/login/controller/manage_vehicle_controller.dart';
import 'package:timxe/screens/login/services/manage_vehicle_api.dart';

// ignore: must_be_immutable
class ManageVehiclePage extends GetView<ManageVehicleController> {
  ManageVehiclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ManageVehicleBinding().dependencies();
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
              return _buildListVehicles(context);
            }
          },
        ));
  }

  ListView _buildListVehicles(BuildContext context) {
    RxList<bool> _switchValues =
        RxList.generate(controller.vehiclesList.length, (_) => false);
    return ListView.builder(
      itemCount: controller.vehiclesList.length,
      itemBuilder: (_, index) {
        if (controller.vehiclesList[index].status == "unuse") {
          _switchValues[index] = false;
        } else {
          _switchValues[index] = true;
        }
        return Obx(
          () => (Column(
            children: [
              ListTileSwitch(
                switchType: SwitchType.custom,
                title: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        controller.vehiclesList[index].vehicleName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                     Align(
                        alignment: Alignment.topLeft,
                       child: Text(
                        controller.vehiclesList[index].vehicleType,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                                         ),
                     ),
                  ],
                ),
                value: _switchValues[index],
                onChanged: (value) async {
                  try {
                    _switchValues[index] = value;
                    if(value){
                    //  await ManageVehicleApi().updateStatusVehicle(controller.vehiclesList[index].id, "inuse");
                    }else {
                    // await  ManageVehicleApi().updateStatusVehicle(controller.vehiclesList[index].id, "unuse");
                    }
                  } finally {
                    // controller.reLoading(true);
                  }
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
