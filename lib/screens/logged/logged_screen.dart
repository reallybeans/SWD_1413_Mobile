import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class LoggedScreen extends StatelessWidget {
  const LoggedScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser!;
    
    return Scaffold(
      appBar: AppBar(title: Text('Logged'),
      centerTitle: true,
      actions: [
        TextButton(onPressed: (){}, child: Text('Logout',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
      ],backgroundColor: Colors.greenAccent[700],
      ),
      body: Container(
        color: Colors.green[50],
        alignment: Alignment.center,
        child: 
      Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Profile',
            style: TextStyle(color:Colors.black,fontSize: 16),
          ),
          SizedBox(height: 32,),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          SizedBox(height: 12,),
          Text(
            'Name: '+user.displayName!,
            style: TextStyle(color:Colors.black,fontSize: 16),
          ),
          SizedBox(height: 8,),
          Text(
            'Name: '+user.email!,
            style: TextStyle(color:Colors.black,fontSize: 16),
          ),
        ],
      )
      ,),
    );
  }
}