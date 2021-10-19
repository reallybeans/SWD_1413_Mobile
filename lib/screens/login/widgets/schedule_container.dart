import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timxe/data/schedule.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleContainer extends StatelessWidget {
  final Schedule scheduleItem;
  const ScheduleContainer(this.scheduleItem);

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 8),
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(
                const Radius.circular(20.0),
              )),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, top: 20),
                height: 80,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    scheduleItem.start,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    scheduleItem.nameCustomer,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Điểm đón:",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(child: Text(scheduleItem.schedule.address.origin))
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Điểm đến: ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                      child: Text(scheduleItem.schedule.address.destination))
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Số điểm dừng: ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('${scheduleItem.schedule.total}'),
                  Spacer()
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Khứ hồi: ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                           Checkbox(value: scheduleItem.mode,onChanged: (bool){},activeColor: Colors.green,),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Tổng tiền: ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent.shade400)),
                  Spacer(),
                  Text('${scheduleItem.price}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent.shade400)),
                  SizedBox(
                    width: 20,
                  ),
                  Text('VNĐ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent.shade400)),
                ],
              ),
              Spacer(),
             SizedBox(height: 30,),
              Spacer(),
            ],
          ),
        ),
      ),
      Positioned(
        top: 0,
        left: 30,
        child: CircleAvatar(
            backgroundColor: Colors.white60.withOpacity(0.3),
            radius: 40,
            // child: CircleAvatar(
            //   backgroundColor: Colors.transparent,
            //   backgroundImage: AssetImage("assets/images/iconMoney.png"),
            //   radius: 40,
            // ),
            child: ClipOval(
                child: SvgPicture.asset(
              "assets/icons/money.svg",
              fit: BoxFit.cover,
              width: 50.0,
              height: 50.0,
            ))),
      ),
      Positioned(
          bottom: -10,
          right: -10,
          child: FlatButton(
            onPressed: () async {
              // launch('tel://${scheduleItem.phone}');
              // await FlutterPhoneDirectCaller.callNumber('0794219080');

              //  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=11.084732443891067, 107.68383795664876';
              String googleUrl =
                  'https://www.google.com/maps/dir/?api=1&origin=${scheduleItem.schedule.latlng.origin}&waypoints=${scheduleItem.schedule.latlng.waypoint[0]}|${scheduleItem.schedule.latlng.waypoint[1]}&destination=${scheduleItem.schedule.latlng.destination}&travelmode=driving&dir_action=navigate';
              if (await canLaunch(googleUrl)) {
                await launch(googleUrl);
              } else {
                throw 'Could not open the map.';
              }
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.7),
              radius: 40,
              child: Container(
                width: 60,
                height: 60,
                // color: Colors.greenAccent[400],
                decoration: BoxDecoration(
                    color: Colors.greenAccent[400],
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child: Icon(
                  Icons.map_sharp,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          )),
    ]);
  }
}
