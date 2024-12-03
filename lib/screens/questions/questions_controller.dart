import 'package:get/get.dart';
import 'package:lifelog/utils/log_util.dart';

class QuestionsController extends GetxController {
  static String tag = "QuestionsController";
  static QuestionsController get to => Get.find();

  // 질문 관련 상태 변수들
  RxList<String> questions = <String>[].obs;
  RxString currentQuestion = ''.obs;
  RxString currentAnswer = ''.obs;

  // 질문 목록을 로드하는 메서드
  Future<void> loadQuestions() async {
    try {
      // TODO: API 연동 시 실제 데이터로 교체
      questions.value = [
        '오늘 하루 중 가장 좋았던 순간은?',
        '내일 꼭 하고 싶은 일은?',
        '오늘 나에게 가장 도움이 된 사람은?',
        '오늘 배운 것이 있다면?'
      ];
    } catch (e) {
      LogUtil.e(tag, '질문 데이터 로드 실패: $e');
    }
  }

  // 답변을 저장하는 메서드
  Future<void> saveAnswer(String question, String answer) async {
    try {
      // TODO: API 연동 시 실제 저장 로직 구현
      currentQuestion.value = question;
      currentAnswer.value = answer;
    } catch (e) {
      LogUtil.e(tag, '답변 저장 실패: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadQuestions(); // 컨트롤러 초기화 시 질문 목록 로드
  }
}
