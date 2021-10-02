import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/phone_login_controller.dart';

class PhoneLoginView extends GetView<PhoneLoginController> {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  late String verificationId;

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: phoneController,
          decoration: InputDecoration(
            hintText: "Nhập số điện thoại",
            prefix: Padding(
              padding: EdgeInsets.all(4),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(17),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              color: Colors.greenAccent[400],
              onPressed: () {
                controller.login(phoneController);
              },
              child: Text('Tiếp tục'),
              textColor: Colors.white,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: otpController,
          decoration: InputDecoration(
            hintText: "nhập OTP",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () {
            controller.otp(otpController);
          },
          child: Text('Đăng Nhập'),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Đăng nhập bằng SĐT'),
        ),
        body: Container(
          child: Obx(
            () => controller.showLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.check.value
                    ? getMobileFormWidget(context)
                    : getOtpFormWidget(context),
          ),
          padding: const EdgeInsets.all(16),
        ));
  }
}
