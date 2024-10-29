import 'package:get/get.dart';
import 'package:lifelog/models/user/user_model.dart';
import 'package:lifelog/repositories/lifelog_repository.dart';
import 'package:lifelog/utils/data_state.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final LifeLogRepository _repo = LifeLogRepository();

  RxInt carouselIndex = 0.obs;
  var userInfo = const UserModel(
    userId: 1, // Provide a valid userId
    username: '', // Provide a default or empty value
    email: '', // Provide a default or empty value
    createdAt: '', // Provide a default or empty value
    updatedAt: '', // Provide a default or empty value
  ).obs; // 사용자 정보를 저장할 변수

  void changeCarouselIdx(int idx) {
    carouselIndex.value = idx;
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserInfo(1); // 초기화 시 사용자 정보를 가져옴 (예: userId가 1인 사용자)
  }

  Future<void> fetchUserInfo(int userId) async {
    var response = await _repo.getUserInfo(userId); // 사용자 정보를 가져오는 API 호출
    if (response is DataSuccess) {
      userInfo.value = response.data!; // 성공적으로 데이터를 가져오면 저장
    } else if (response is DataFailed) {
      userInfo.value = const UserModel(
        userId: 0, // Provide a default or placeholder userId
        username: '', // Provide a default or empty value
        email: '', // Provide a default or empty value
        createdAt: '', // Provide a default or empty value
        updatedAt: '', // Provide a default or empty value
      ); // 실패 시 빈 사용자 모델로 초기화
      throw Exception('Failed to load user info: ${response.error}');
    }
  }
}
