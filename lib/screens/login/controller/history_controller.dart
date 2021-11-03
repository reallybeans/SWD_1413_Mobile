import 'dart:async';

import 'package:get/get.dart';
import 'package:timxe/data/history.dart';
import 'package:timxe/screens/login/services/get_history_api.dart';
import 'package:timxe/screens/login/services/get_schedule_api.dart';

class HistoryController extends GetxController {
  var historyList = List<History>.empty().obs;

  @override
  void onInit() async {
    // Timer.periodic(
    //     Duration(seconds: 2),
    //     (Timer t) =>
    //         {print("TEST THỬ CHƠI TRONG NAVCONTROLLER"), fetchUsers()});
    fecthUsers();
    print('init cua historyController CHU IN HOA NE DUOC CHUA');
    super.onInit();
  }

  @override
  void onReady() {
    update();
    super.onReady();
    print('onReady cua historyController CHU IN HOA NE DUOC CHUA');
  }

  @override
  void onClose() {}
  void fecthUsers() async {
    var history = await GetHistoryApi.fetchUser();

    if (history != null) {
      historyList.value = history;
    }
  }
}
