import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.yellow),
        ),
      ),
    );
  }
}
