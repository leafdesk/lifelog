import 'package:get/get.dart';
import 'package:lifelog/models/question/question_model.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:lifelog/utils/log_util.dart';
import 'package:lifelog/repositories/custom_question_repository.dart';

class DiaryEntryController extends GetxController {
  static String tag = "DiaryEntryController";
  RxList<QuestionModel> questions = <QuestionModel>[].obs;
  RxString currentQuestion = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadQuestions(); // 컨트롤러 초기화 시 질문 목록 로드
  }

  Future<void> loadQuestions() async {
    try {
      int userId = 1; // 실제 사용자 ID로 대체
      final result =
          await CustomQuestionRepository().getCustomQuestionsByUser(userId);

      if (result is DataSuccess<List<QuestionModel>>) {
        questions.assignAll(result.data ?? []);
      } else {
        LogUtil.e(tag, 'loadQuestions. ${result.error}');
        questions.assignAll([]);
      }
    } catch (e) {
      LogUtil.e(tag, 'loadQuestions. $e');
      questions.assignAll([]);
    }
  }
}
