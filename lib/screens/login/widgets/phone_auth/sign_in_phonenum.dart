import 'package:flutter/material.dart';
import 'package:timxe/common/rounded_button.dart';
import 'package:timxe/screens/login/widgets/phone_auth/otp_screen.dart';

class LoginByPhone extends StatefulWidget {
  @override
  _LoginByPhoneState createState() => _LoginByPhoneState();
}

class _LoginByPhoneState extends State<LoginByPhone> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: BackButtonIcon(),
      // backgroundColor: Colors.greenAccent[400],
      appBar: AppBar(
        actions: [
          Container(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_rounded),
            ),
          )
        ],
        title: Text('Đăng nhập SĐT'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    "Nhập Số Điện Thoại",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Số điện thoại',
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('+84'),
                    ),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  controller: _controller,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            // child: RoundedButton(
            //   press: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => OTPScreen(_controller.text)));
            //   },
            //   text: 'Đăng nhập',
            // ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: Colors.greenAccent[400],
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OTPScreen(_controller.text)));
                },
                child: Text('Đăng nhập'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
