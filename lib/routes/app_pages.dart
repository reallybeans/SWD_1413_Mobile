import 'package:get/get.dart';
import 'package:timxe/screens/login/binding/home_binding.dart';
import 'package:timxe/screens/login/binding/login_binding.dart';
import 'package:timxe/screens/login/binding/start_binding.dart';
import 'package:timxe/screens/login/binding/welcome_binding.dart';
import 'package:timxe/screens/login/views/home_view.dart';
import 'package:timxe/screens/login/views/login_screen.dart';
import 'package:timxe/screens/login/views/start_view.dart';
import 'package:timxe/screens/login/views/welcome.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
      GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
      GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
         GetPage(
      name: _Paths.START,
      page: () => StartView(),
      binding: StartBinding(),
    ),
    
  ];
}
