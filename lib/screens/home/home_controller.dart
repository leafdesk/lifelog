import 'package:get/get.dart';
import 'package:lifelog/models/user/user_model.dart';
import 'package:lifelog/repositories/user_repository.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:flutter/material.dart';
import 'package:lifelog/utils/log_util.dart';

class HomeController extends GetxController {
  static String tag = "HomeController";
  static HomeController get to => Get.find();
  final UserRepository _userRepository = UserRepository();

  RxString username = 'initial username'.obs;
  RxString email = 'initial email'.obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  RxString mood = 'initial mood'.obs;
  RxString diaryEntry = 'initial diary entry'.obs;
  RxString photoUrl = 'initial photo url'.obs;
  RxString customQuestion = 'initial custom question'.obs;

  /// API 테스트 수행.
  void doApiTest() async {
    var result = await _userRepository.getUser(1);
    if (result is DataSuccess) {
      var user = result.data;
      if (user != null) {
        username.value = user.username ?? '';
        email.value = user.email ?? '';
      }
    }
  }

  /// 선택된 날짜 업데이트
  void updateSelectedDay(DateTime day) {
    selectedDay.value = day;
  }
}
