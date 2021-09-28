import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:timxe/routes/app_pages.dart';
import 'package:timxe/screens/login/controller/welcome_controller.dart';
import 'package:timxe/screens/login/services/api_service.dart';

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
    var check = await apiService.apiCheckLogin();
    if (isLoggedIn) {
      if (check)
        Get.offAllNamed(Routes.WELCOME, arguments: firebaseAuth.currentUser);
      else {
        logout() async {
          await googleSign.disconnect();
          await firebaseAuth.signOut();
        }
      }
    } else {
      Get.offAllNamed(Routes.START);
    }
  }
}
