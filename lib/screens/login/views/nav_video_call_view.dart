import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:timxe/screens/login/services/get_schedule_api.dart';
import 'package:timxe/screens/login/widgets/video_call.dart';
import 'package:uuid/uuid.dart';

class NavVideoCallView extends StatefulWidget {
  const NavVideoCallView({Key? key}) : super(key: key);

  @override
  _NavVideoCallViewState createState() => _NavVideoCallViewState();
}

class _NavVideoCallViewState extends State<NavVideoCallView> {
  String _meetingCode = "abcdfgqw";

  @override
  void initState() {
    var uuid = Uuid();
    _meetingCode = uuid.v1().substring(0, 8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green[900],
          title: const Text(
            'Phòng Chat',
            style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
      backgroundColor: Colors.greenAccent[700],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 35),
            Image.network(
              "https://user-images.githubusercontent.com/67534990/127524449-fa11a8eb-473a-4443-962a-07a3e41c71c0.png",
              fit: BoxFit.cover,
              // height: 200,
            ),
            SizedBox(height: 20),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: () {
                Get.to(VideoCall( ));
              },
              icon: Icon(Icons.video_call),
              label: Text("Tham gia cuộc gọi"),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                primary: Colors.indigo,
                side: BorderSide(color: Colors.indigo.shade700),
                fixedSize: Size(350, 35),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
