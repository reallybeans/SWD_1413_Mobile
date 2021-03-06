import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:timxe/data/booking.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleContainer extends StatelessWidget {
  final Booking scheduleItem;
  const ScheduleContainer(this.scheduleItem);

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.only(left: 8),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      scheduleItem.nameCustomer,
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${scheduleItem.startAt.day}' +
                              "/" +
                              '${scheduleItem.startAt.month}' +
                              "/" +
                              '${scheduleItem.startAt.year}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${scheduleItem.startAt.hour}' +
                              ":" +
                              '${scheduleItem.startAt.minute}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text("??i???m ????n:",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(child: Text(scheduleItem.schedule.address.origin))
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text("??i???m ?????n: ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                      child: Text(scheduleItem.schedule.address.destination))
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("S??? ??i???m d???ng: ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text('${scheduleItem.schedule.total}'),
                  const Spacer()
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Kh??? h???i: ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Checkbox(
                    value: scheduleItem.mode,
                    // ignore: avoid_types_as_parameter_names
                    onChanged: (bool) {},
                    activeColor: Colors.green,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("T???ng ti???n: ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent.shade400)),
                  const Spacer(),
                  Text('${scheduleItem.priceBooking}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent.shade400)),
                  const SizedBox(
                    width: 20,
                  ),
                  Text('VN??',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent.shade400)),
                  Spacer()
                ],
              ),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      ),
      Positioned(
          bottom: -10,
          right: 10,
          child: SpeedDial(
            icon: Icons.menu,
            backgroundColor: Colors.greenAccent,
            overlayColor: Colors.transparent,
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                  child: IconButton(
                      onPressed: () async {
                        String waitpoints = "waypoints=";
                        for (var i = 0;
                            i < scheduleItem.schedule.address.waypoint.length;
                            i++) {
                          if (i ==
                              (scheduleItem.schedule.address.waypoint.length -
                                  1)) {
                            waitpoints = waitpoints +
                                scheduleItem.schedule.address.waypoint[i];
                          } else {
                            waitpoints = waitpoints +
                                scheduleItem.schedule.address.waypoint[i] +
                                "|";
                          }
                        }
                        String googleUrl =
                            'https://www.google.com/maps/dir/?api=1&origin=${scheduleItem.schedule.address.origin}&${waitpoints}&destination=${scheduleItem.schedule.address.destination}&travelmode=driving&dir_action=navigate';
                        if (await canLaunch(googleUrl)) {
                          await launch(googleUrl);
                        } else {
                          throw 'Could not open the map.';
                        }
                      },
                      icon: Icon(Icons.map_sharp)),
                  label: 'H??nh tr??nh'),
              SpeedDialChild(
                  child: IconButton(
                    onPressed: () async {
                      launch('tel://${scheduleItem.phoneCustomer}');
                    },
                    icon: Icon(Icons.phone),
                  ),
                  label: "??i???n tho???i")
            ],
          )),
      Positioned(
        top: 0,
        right: 0,
        child: CircleAvatar(radius: 25,backgroundColor: Colors.amber,child: Text("${scheduleItem.typeVehicle}",style: TextStyle(fontWeight: FontWeight.bold),)),
      )
    ]);
  }
}
