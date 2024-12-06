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
  RxList<QuestionModel> questions = <QuestionModel>[].obs;
  RxString currentQuestion = ''.obs;
  RxString currentAnswer = ''.obs;

  // 질문 목록을 로드하는 메서드
  Future<void> loadQuestions() async {
    try {
      int userId = 1; // Replace with actual user ID retrieval method

      final result =
          await CustomQuestionRepository().getCustomQuestionsByUser(userId);

      if (result is DataSuccess<List<QuestionModel>>) {
        questions.value =
            result.data ?? []; // Directly assign the list of QuestionModel
      } else {
        LogUtil.e(tag, 'loadQuestions. ${result.error}');
        questions.value = []; // Initialize to empty list on error
      }
    } catch (e) {
      LogUtil.e(tag, 'loadQuestions. $e');
      questions.value = []; // Initialize to empty list on exception
    }
  }

  // 질문을 생성하는 메서드
  Future<void> createCustomQuestion(
      String question, String questionType, List<String> options) async {
    try {
      final questionData = {
        "question_text": question,
        "user_id": 1, // Replace with actual user ID retrieval method
        "question_type": questionType,
      };

      if (questionType == '객관식') {
        questionData['options'] =
            options; // Add options for multiple choice questions
      }

      final result =
          await CustomQuestionRepository().createCustomQuestion(questionData);

      LogUtil.i(tag, 'createCustomQuestion. result: $result');
    } catch (e) {
      LogUtil.e(tag, 'createCustomQuestion. $e');
    } finally {
      await loadQuestions();
    }
  }

  Future<void> deleteCustomQuestion(int index) async {
    try {
      int questionId = questions[index].id!; // Use the null check operator
      final result =
          await CustomQuestionRepository().deleteCustomQuestion(questionId);

      LogUtil.i(tag, 'deleteCustomQuestion. result: $result');
    } catch (e) {
      LogUtil.e(tag, 'deleteCustomQuestion. $e');
    } finally {
      await loadQuestions();
    }
  }

  Future<void> updateCustomQuestion(
      int index, String updatedText, String questionType) async {
    try {
      int questionId =
          questions[index].id!; // Get the ID of the question to update
      final questionData = {
        "question_text": updatedText,
        "user_id": 1, // 실제 사용자 ID로 대체
        "question_type": questionType, // (객관식, 주관식)
      };

      final result = await CustomQuestionRepository()
          .updateCustomQuestion(questionId, questionData);

      LogUtil.i(tag, 'updateCustomQuestion. result: $result');
    } catch (e) {
      LogUtil.e(tag, 'updateCustomQuestion. $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadQuestions(); // 컨트롤러 초기화 시 질문 목록 로드
  }
}
