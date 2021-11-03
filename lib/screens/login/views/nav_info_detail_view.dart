import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';

class InfomationDetail extends GetView<WelcomeController> {
  const InfomationDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text('Thông tin cá nhân'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(controller.user.photoURL!),
            ),
            const SizedBox(
              height: 30,
            ),
            InfomationTextField(
              lbtxt: 'Họ và tên',
              initValue: '${controller.homeController.currentDriver.name}',
              Icons: Icons.account_circle,
            ),
            InfomationTextField(
              lbtxt: 'Số điện thoại',
              initValue: "${controller.homeController.currentDriver.phone}",
              Icons: Icons.phone,
            ),
            InfomationTextField(
              lbtxt: 'Gmail',
              initValue: "${controller.user.email}",
              Icons: Icons.email,
            ),
          ],
        ),
      ),
    );
  }
}

class InfomationTextField extends StatelessWidget {
  const InfomationTextField({
    Key? key,
    required this.lbtxt,
    required this.initValue,
    // ignore: non_constant_identifier_names
    required this.Icons,
  }) : super(key: key);

  final String lbtxt;
  final String initValue;
  final Icons;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: TextFormField(
        initialValue: initValue,
        enabled: false,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
            labelText: lbtxt,
            prefixIcon: Icon(Icons),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffCED0D2), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(6)))),
      ),
    );
  }
}
