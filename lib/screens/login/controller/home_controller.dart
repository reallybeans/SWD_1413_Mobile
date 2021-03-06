import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:timxe/data/driver.dart';
import 'package:timxe/routes/app_pages.dart';
import 'package:timxe/screens/login/controller/new_booking_controller.dart';
import 'package:timxe/screens/login/services/checklogin_api.dart';
import 'package:timxe/screens/login/services/update_driver_api.dart';

class HomeController extends GetxController {
  late GoogleSignIn googleSign;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String deviceId = "";//*
  late Driver currentDriver;
  var onlineDriver = false.obs;

  // var test = false.obs;

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void onInit() {
    super.onInit();
    ever(
        onlineDriver,
        (callback) async => {
              if (onlineDriver.value)
                {
                  await UpdateDriverApi().updateStatusDriver(
                     currentDriver.id, "on"),
                }
              else
                {
                  await UpdateDriverApi().updateStatusDriver(
                      currentDriver.id, "off"),
                }
            });

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    _fcm
        .getToken()
        .then((token) => {print('The token||' + token!), deviceId = token});

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // ignore: avoid_print
      print('B???t ?????u fetchCu???c');
      Get.put(NewBookingController());
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

//Listen to open app redirect to view

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     Get.toNamed("/navnotify");
    //   }
    // });
  }

  @override
  void onReady() async {
    // final coordinates= new Coordinates(10.7950178,106.7196648);
    // var address=await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // print("D??ng s??? 1: "'${address.first.featureName}');
    //  print("D??ng s??? 2: "'${address.first.addressLine}');
    googleSign = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });

    super.onReady();
  }

  @override
  void onClose() {}

  void handleAuthStateChanged(isLoggedIn) async {
    print("Token trong HAM: " + deviceId);
    if (isLoggedIn) {
      currentDriver = await ApiService().apiCheckLogin(
          await firebaseAuth.currentUser!.getIdToken(), deviceId);
      if (currentDriver != null)
        Get.offAllNamed(Routes.WELCOME, arguments: firebaseAuth.currentUser);
      else {
        await googleSign.disconnect();
        await firebaseAuth.signOut();
      }
    } else {
      Get.offAllNamed(Routes.START);
    }
  }
}
