import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:timxe/routes/app_pages.dart';
import 'package:timxe/screens/login/controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.greenAccent[700],
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(),
           SvgPicture.asset("assets/icons/logo_welcome.svg"),
            const Spacer(),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    // PhoneButton(),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed(Routes.PHONELOGIN);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.phone,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'Tiếp tục với số điện thoại',
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            minimumSize: const Size(double.infinity, 50)),
                      ),
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Expanded(
                          child: Divider(
                            height: 40,
                            color: Colors.white,
                          ),
                        ),
                        const Text("OR", style: TextStyle(color: Colors.white)),
                        const Expanded(
                            child: Divider(
                          height: 40,
                          color: Colors.white,
                        )),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          controller.login();
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                        ),
                        label: const Text(
                          'Tiếp tục với Google',
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            minimumSize: const Size(double.infinity, 50)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
