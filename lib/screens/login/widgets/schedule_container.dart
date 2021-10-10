import 'package:flutter/material.dart';
import 'package:timxe/data/schedulev1.dart';
import 'package:timxe/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleContainer extends StatelessWidget{
 final Schedule scheduleItem;
  const ScheduleContainer(this.scheduleItem);
  
  @override
  Widget build(BuildContext context){
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        margin: EdgeInsets.only(top: 30),
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(
              const Radius.circular(20.0),
            )),
        child: Center(child: Container(child: Text(scheduleItem.nameCustomer))),
      ),
      Positioned(
        top: 0,
        left: 30,
        child: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.6),
          radius: 50,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
             backgroundImage: NetworkImage(scheduleItem.phone),
            radius: 50,
          ),
        ),
      ),
      Positioned(
          bottom: -20,
          right: -30,
          child: FlatButton(
            onPressed: () async {
              // launch('tel://+84794219080');
              // await FlutterPhoneDirectCaller.callNumber('0794219080');

              //  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=11.084732443891067, 107.68383795664876';
                String googleUrl = 'https://www.google.com/maps/dir/?api=1&origin=${scheduleItem.schedule.latlng.origin}&destination=10.8415,106.8100&travelmode=driving&dir_action=navigate';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.7),
              radius: 50,
              child: Container(
                width: 80,
                height: 80,
                // color: Colors.greenAccent[400],
                decoration: BoxDecoration(
                    color: Colors.greenAccent[400],
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          )),
    ]);
  }
}