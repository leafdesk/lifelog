import 'package:get/get.dart';
import 'package:lifelog/models/user/user_model.dart';
import 'package:lifelog/repositories/user_repository.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:lifelog/utils/log_util.dart';

class HomeController extends GetxController {
  static String tag = "HomeController";
  static HomeController get to => Get.find();
  final UserRepository userRepository = UserRepository();

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

  RxInt carouselIndex = 0.obs;
  var userInfo = const UserModel(
    userId: 1,
    username: '',
    email: '',
    createdAt: '',
    updatedAt: '',
  ).obs;

  Rx<DateTime> selectedDay = DateTime.now().obs;
  RxString mood = "좋음".obs; // 감정 상태
  RxString diaryEntry =
      "오늘은 정말 좋은 하루였습니다. 친구들과 함께 시간을 보내며 많은 이야기를 나눴어요.".obs; // 일기
  RxString photoUrl = "https://via.placeholder.com/150".obs; // 사진 URL
  RxString customQuestion = "오늘 가장 감사했던 순간은?".obs; // 사용자 지정 질문

  // 추가된 로딩 상태 변수
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;

  void updateSelectedDay(DateTime newSelectedDay) {
    selectedDay.value = newSelectedDay;
  }

  void changeCarouselIdx(int idx) {
    carouselIndex.value = idx;
  }

  @override
  void onInit() {
    super.onInit();
    getUser(1);
  }

  /// 특정 ID로 유저 정보 조회.
  ///
  ///
  Future<void> getUser(int userId) async {
    isLoading.value = true;
    errorMessage.value = "";

    var response = await userRepository.getUser(userId);
    LogUtil.d(tag, "API Response: ${response.toString()}");

    if (response is DataSuccess) {
      userInfo.value = response.data!;
    } else {
      userInfo.value = const UserModel();
    }

    if (response is DataFailed) {
      errorMessage.value = 'Failed to load user info: ${response.error}';
    } else if (response is DataLocalFailed) {
      errorMessage.value = 'Local error: ${response.localError}';
    } else {
      errorMessage.value = '';
    }

    isLoading.value = false;
  }
}
