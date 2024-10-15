import 'package:get/get.dart';

class AppController extends GetxService {
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changeScreenIndex(int index) {
    /**
     * 스크린 인덱스 변경.
     */
    currentIndex.value = index;
  }
}
