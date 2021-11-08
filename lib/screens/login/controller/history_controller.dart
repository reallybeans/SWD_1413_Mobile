import 'dart:async';

import 'package:get/get.dart';
import 'package:timxe/data/history.dart';
import 'package:timxe/screens/login/services/get_history_api.dart';
import 'package:timxe/screens/login/services/get_schedule_api.dart';

class HistoryController extends GetxController {
  var historyList = List<History>.empty().obs;
  var isLoading = false.obs;
  @override
  void onInit() async {
     fectHistories();
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
  void fectHistories() async {
    try {
      isLoading(true);
      var histories = await GetHistoryApi.fetchHistory();
      if (histories != null) {
        historyList.assignAll(histories);
      }
    } finally {
      isLoading(false);
    }
  }
}
