
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:timxe/screens/login/views/home_view.dart';

class LifeCycleController extends SuperController {

  @override
  void onDetached() {
    print("Hàm detactch chạy");
  }

  @override
  void onInactive() {
     print("Hàm inactive chạy");
  }

  @override
  void onPaused() {
 print("Hàm pauches chạy");
//  Get.to(()=>HomeView());
  }

  @override
  void onResumed() {
     print("Hàm resum chạy");
  }
  

}