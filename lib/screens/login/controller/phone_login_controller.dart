import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:timxe/routes/app_pages.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';

class PhoneLoginController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  RxBool check = true.obs;

  late String verificationId;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool showLoading = false.obs;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    showLoading.value = true;

    try {
      final AuthCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      showLoading.value = false;

      // ktra da~ dang nhap chua
      if (AuthCredential.user != null) {
        Get.offAllNamed(Routes.WELCOME, arguments: _auth.currentUser);
      }
    } on FirebaseAuthException catch (e) {
      showLoading.value = false;

      // ignore: deprecated_member_use
      _scaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  void login(phoneController) async {
    showLoading.value = true;
    String sdt = phoneController.text;
    phoneController.text = '+84' + sdt;
    print(phoneController.text);
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (phoneAuthCredential) async {
        showLoading.value = false;
        // signInWithPhoneAuthCredential(phoneAuthCredential);
      },
      verificationFailed: (verificationFailed) async {
        _scaffoldKey.currentState!.showSnackBar(
            SnackBar(content: Text(verificationFailed.message.toString())));
      },
      codeSent: (verificationId, resendingToken) async {
        showLoading.value = false;
        check.value = false;
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }

  void otp(otpController) async {
    final phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpController.text);
    signInWithPhoneAuthCredential(phoneAuthCredential);
  }
}
