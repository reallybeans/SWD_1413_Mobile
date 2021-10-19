import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';
import 'package:timxe/screens/login/views/home_view.dart';

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
            SizedBox(
              height: 32,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(controller.user.photoURL!),
            ),
            SizedBox(
              height: 30,
            ),
            InfomationTextField(
              lbtxt: 'Họ và tên',
              initValue: 'Nguyễn Huy Trí Cường',
              Icons: Icons.account_circle,
            ),
            InfomationTextField(
              lbtxt: 'Số điện thoại',
              initValue: "+8425136644",
              Icons: Icons.phone,
            ),
            InfomationTextField(
              lbtxt: 'Gmail',
              initValue: "cuong123@gmail.com",
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
    required this.Icons,
  }) : super(key: key);

  final String lbtxt;
  final String initValue;
  final Icons;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: TextFormField(
        initialValue: initValue,
        enabled: false,
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
            labelText: lbtxt,
            prefixIcon: Icon(Icons),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffCED0D2), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(6)))),
      ),
    );
  }
}
