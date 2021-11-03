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
      backgroundColor: Colors.greenAccent[400],
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
            Text(
              "Enter meeting below",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            //   child: Card(
            //       color: Colors.grey[300],
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(25),
            //       ),
            //       child: ListTile(
            //         leading: Icon(Icons.link),
            //         title: SelectableText(
            //           _meetingCode,
            //           style: TextStyle(fontWeight: FontWeight.w300),
            //         ),
            //         trailing: Icon(Icons.copy),
            //       )),
            // ),
            // Divider(thickness: 1, height: 40, indent: 20, endIndent: 20),
            // ElevatedButton.icon(
            //   onPressed: () {
            //     Share.share("Meeting Code : $_meetingCode");
            //   },
            //   icon: Icon(Icons.arrow_drop_down),
            //   label: Text("Share invite"),
            //   style: ElevatedButton.styleFrom(
            //     fixedSize: Size(350, 30),
            //     primary: Colors.indigo,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(25)),
            //   ),
            // ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: () {
                // GetScheduleApi a =new GetScheduleApi();
              //  String str= a.getToken("test") as String;
                Get.to(VideoCall( ));
                // Get.to(MyApp());
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
