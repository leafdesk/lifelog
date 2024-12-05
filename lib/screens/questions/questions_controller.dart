import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifelog/models/question/question_model.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:lifelog/utils/log_util.dart';
import 'package:lifelog/repositories/custom_question_repository.dart'; // Import the repository

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
      int userId = 1; // Replace with actual user ID retrieval method

      final result =
          await CustomQuestionRepository().getCustomQuestionsByUser(userId);

      if (result is DataSuccess<List<QuestionModel>>) {
        questions.value = result.data?.map((q) => q.question).toList() ??
            []; // Safely access questions
      } else {
        LogUtil.e(tag, '질문 데이터 로드 실패: ${result.error}');
        questions.value = []; // Initialize to empty list on error
      }
    } catch (e) {
      LogUtil.e(tag, '질문 데이터 로드 실패: $e');
      questions.value = []; // Initialize to empty list on exception
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
