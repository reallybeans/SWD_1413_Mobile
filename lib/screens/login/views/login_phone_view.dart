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
        const Spacer(),
        TextField(
          controller: phoneController,
          decoration: const InputDecoration(
            hintText: "Nhập số điện thoại",
            prefix: Padding(
              padding: EdgeInsets.all(4),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(17),
            // ignore: deprecated_member_use
            child: FlatButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              color: Colors.greenAccent[400],
              onPressed: () {
                controller.login(phoneController);
              },
              child: Text('Tiếp tục'),
              textColor: Colors.white,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        const Spacer(),
        TextField(
          controller: otpController,
          decoration: const InputDecoration(
            hintText: "nhập OTP",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            controller.otp(otpController);
          },
          child: const Text('Đăng Nhập'),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        const Spacer(),
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
