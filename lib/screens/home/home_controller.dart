import 'package:get/get.dart';
import 'package:lifelog/models/user/user_model.dart';
import 'package:lifelog/repositories/_repository.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  /// 숫자.
  RxInt number = 0.obs;

  /// 숫자 증가.
  void increaseNumber() {
    number.value++;
  }

  /// 숫자 감소.
  void decreaseNumber() {
    number.value--;
  }
}

// class HomeController extends GetxController {
//   static HomeController get to => Get.find();
//   final LifeLogRepository _repo = LifeLogRepository();

//   RxInt carouselIndex = 0.obs;
//   var userInfo = const UserModel(
//     userId: 1,
//     username: '',
//     email: '',
//     createdAt: '',
//     updatedAt: '',
//   ).obs;

//   Rx<DateTime> selectedDay = DateTime.now().obs;
//   RxString mood = "좋음".obs; // 감정 상태
//   RxString diaryEntry =
//       "오늘은 정말 좋은 하루였습니다. 친구들과 함께 시간을 보내며 많은 이야기를 나눴어요.".obs; // 일기
//   RxString photoUrl = "https://via.placeholder.com/150".obs; // 사진 URL
//   RxString customQuestion = "오늘 가장 감사했던 순간은?".obs; // 사용자 지정 질문

//   // 추가된 로딩 상태 변수
//   RxBool isLoading = false.obs;
//   RxString errorMessage = "".obs;

//   void updateSelectedDay(DateTime newSelectedDay) {
//     selectedDay.value = newSelectedDay;
//   }

//   void changeCarouselIdx(int idx) {
//     carouselIndex.value = idx;
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserInfo(1);
//   }

//   Future<void> fetchUserInfo(int userId) async {
//     // 로딩 시작
//     isLoading.value = true;
//     errorMessage.value = ""; // 이전 에러 메시지 초기화

//     var response = await _repo.getUserInfo(userId);
//     if (response is DataSuccess) {
//       userInfo.value = response.data!;
//     } else if (response is DataFailed) {
//       // 실패 시 기본값으로 초기화하고 에러 메시지 설정
//       userInfo.value = const UserModel(
//         userId: 0,
//         username: '',
//         email: '',
//         createdAt: '',
//         updatedAt: '',
//       );
//       errorMessage.value = 'Failed to load user info: ${response.error}';
//       // Get.snackbar(
//       //   "Error",
//       //   errorMessage.value,
//       //   snackPosition: SnackPosition.BOTTOM,
//       //   backgroundColor: Colors.red,
//       //   colorText: Colors.white,
//       // );
//     }

//     // 로딩 종료
//     isLoading.value = false;
//   }
// }
