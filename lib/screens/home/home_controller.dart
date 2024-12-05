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

  var focusedDay = DateTime.now().obs;

  // 날짜별 일기 데이터를 저장할 변수들
  var dailyMood = ''.obs;
  var dailyDiaryEntry = ''.obs;
  var dailyPhotoUrl = ''.obs;
  var dailyCustomQuestion = ''.obs;

  /// API 테스트 수행.
  void doApiTest() async {
    var result = await _userRepository.getUser(2);
    if (result is DataSuccess) {
      var user = result.data;
      if (user != null) {
        username.value = user.username ?? '';
        email.value = user.email ?? '';

        print('username: ${username.value}');
        print('email: ${email.value}');
      }
    }
  }

  /// 선택된 날짜 업데이트
  void updateSelectedDay(DateTime day) {
    selectedDay.value = day;
    loadDiaryData(day); // 선택된 날짜의 데이터 로드
  }

  // 선택된 날짜의 일기 데이터를 가져오는 메서드
  Future<void> loadDiaryData(DateTime date) async {
    try {
      // API 호출하여 해당 날짜의 데이터 가져오기
      // 임시로 더미 데이터를 설정
      dailyMood.value = '행복함 😊';
      dailyDiaryEntry.value =
          '${date.year}/${date.month}/${date.day}의 일기 내용입니다.';
      dailyPhotoUrl.value = 'https://example.com/photo.jpg';
      dailyCustomQuestion.value = '오늘의 질문: 가장 기억에 남는 순간은?';

      // TODO: 실제 API 연동 시 아래와 같이 구현
      // final response = await lifelogApi.getDiaryEntry(date);
      // dailyMood.value = response.mood;
      // dailyDiaryEntry.value = response.content;
      // 등등...
    } catch (e) {
      LogUtil.e(tag, '일기 데이터 로드 실패: $e');
    }
  }
}
