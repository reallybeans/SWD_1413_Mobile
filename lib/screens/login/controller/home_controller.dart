import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:timxe/routes/app_pages.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';
import 'package:timxe/screens/login/services/checklogin_api.dart';

class HomeController extends GetxController {
  late GoogleSignIn googleSign;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    // final coordinates= new Coordinates(10.7950178,106.7196648);
    // var address=await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // print("Dòng số 1: "'${address.first.featureName}');
    //  print("Dòng số 2: "'${address.first.addressLine}');
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
    ApiService sv=new ApiService();
    if (isLoggedIn) {
    var check = await sv.apiCheckLogin(await firebaseAuth.currentUser!.getIdToken());
      if (check)
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
