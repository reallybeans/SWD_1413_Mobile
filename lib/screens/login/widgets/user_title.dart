import 'package:flutter/material.dart';
import 'package:timxe/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

class UserTitle extends StatelessWidget{
 final User user;
  const UserTitle(this.user);
  
  @override
  Widget build(BuildContext context){
    return Stack(clipBehavior: Clip.none, children: [
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
        child: Center(child: Container(child: Text(user.first_name+user.last_name))),
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
             backgroundImage: NetworkImage(user.avt),
            radius: 50,
          ),
        ),
      ),
      Positioned(
          bottom: -20,
          right: -30,
          child: FlatButton(
            onPressed: () async {
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