import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:timxe/config.dart';
import 'package:timxe/data/schedule.dart';
import 'package:timxe/screens/login/controller/home_controller.dart';
import 'package:timxe/screens/login/controller/nav_shedule_controller.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';
import 'package:timxe/screens/login/services/search_schedule_api.dart';
import 'package:url_launcher/url_launcher.dart';

class NavSheduleView extends GetView<NavSheduleController> {
  WelcomeController welcomeController = Get.find<WelcomeController>();
  final listSchedule = [
    Schedule1(nameCustomer: 'nameCustomer1'),
    Schedule1(nameCustomer: 'nameCustomer2'),
    Schedule1(nameCustomer: 'nameCustomer3'),
    Schedule1(nameCustomer: 'nameCustomer4'),
    Schedule1(nameCustomer: 'nameCustomer5'),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: double.infinity,
          height: 60,
          color: Colors.green[900],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(welcomeController.user.photoURL!),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  height: 40,
                  child: TypeAheadField<Schedule?>(
                    hideSuggestionsOnKeyboardHide: false,
                    textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 5),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.greenAccent[700],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Search Username',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    suggestionsCallback: ScheduleApi.getSchedule,
                    itemBuilder: (context, Schedule? suggestion) {
                      final schedule = suggestion!;

                      return ListTile(
                        title: Container(child: Text(schedule.nameCustomer)),
                      );
                    },
                    noItemsFoundBuilder: (context) => Container(
                      height: size.height * 0.05,
                      child: Center(
                        child: Text(
                          'No Users Found.',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    onSuggestionSelected: (Schedule? suggestion) {
                      final schedule = suggestion!;

                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content:
                              Text('Selected user: ${schedule.nameCustomer}'),
                        ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Lịch trình',
                style: TextStyle(fontSize: 34),
              )),
        ),
        Spacer(),
        CarouselSlider.builder(
          itemCount: listSchedule.length,
          itemBuilder: (context, index, realIndex) {
            Schedule1 _schedule = listSchedule[index];
            return formSchedule(_schedule);
          },
          options: CarouselOptions(
            height: size.height * 0.6,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
          ),
        ),
        Spacer(),
       
      ],
    ));
  }
  Widget formSchedule(Schedule1 schedule){
    return   Stack(clipBehavior: Clip.none, 
    children: [
      Container(
          // margin: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
           margin: EdgeInsets.only(top: 30),
          // width: double.infinity,
          // height: double.infinity,
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(
                const Radius.circular(20.0),
              )),
              child: Center(child: Container(child: Text(schedule.nameCustomer))),
              ),
      Positioned(
        top: 0,
        left: 30,
        child: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.6),
          radius: 50,
          child: CircleAvatar(
            // backgroundImage: AssetImage(urlImage),
            backgroundColor: Colors.transparent,
            // backgroundImage: AssetImage('assets/images/iconMoney.png'),
            radius: 50,
          ),
        ),
      ),
       Positioned(
          bottom: -20,
          right: -30,
          child: 
            FlatButton(
              onPressed:()async{
                launch('tel://+84794219080');
                // await FlutterPhoneDirectCaller.callNumber('0794219080');
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.7),
                radius: 50,
                child: Container(
                  width: 80,
                  height: 80,
                  // color: Colors.greenAccent[400],
                  decoration: BoxDecoration(color: Colors.greenAccent[400],borderRadius: new BorderRadius.all(Radius.circular(50))),child: Icon(Icons.phone,color: Colors.white,size: 30,),
                ),
              ),
            )
              ),
    ]);
  }
}
