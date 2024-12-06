import 'package:get/get.dart';
import 'package:lifelog/models/question/question_model.dart';
import 'package:lifelog/repositories/answer_repository.dart';
import 'package:lifelog/repositories/diary_repository.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:lifelog/utils/log_util.dart';
import 'package:lifelog/repositories/custom_question_repository.dart';

class DiaryEntryController extends GetxController {
  static String tag = "DiaryEntryController";
  RxList<QuestionModel> questions = <QuestionModel>[].obs;
  RxList<String> answers = <String>[].obs;
  final DiaryRepository diaryRepository = DiaryRepository();
  final AnswerRepository answerRepository = AnswerRepository();

  @override
  void onInit() {
    super.onInit();
    loadQuestions(); // Load questions on initialization
  }

  Future<void> loadQuestions() async {
    try {
      int userId = 1; // Replace with actual user ID
      final result =
          await CustomQuestionRepository().getCustomQuestionsByUser(userId);

      if (result is DataSuccess<List<QuestionModel>>) {
        questions.assignAll(result.data ?? []);
        answers.assignAll(
            List.filled(questions.length, '')); // Initialize answers list
      } else {
        LogUtil.e(tag, 'loadQuestions. ${result.error}');
        questions.assignAll([]);
        answers.assignAll([]);
      }
    } catch (e) {
      LogUtil.e(tag, 'loadQuestions. $e');
      questions.assignAll([]);
      answers.assignAll([]);
    }
  }

  /// 일기 등록 메서드
  /// emotionScore: 감정 점수
  /// diaryContent: 일기 내용
  /// date: 일기 작성 날짜
  Future<void> submitDiaryEntry(
      int? emotionScore, String diaryContent, DateTime date) async {
    try {
      LogUtil.d(tag,
          'submitDiaryEntry. emotionScore: $emotionScore, diaryContent: $diaryContent');
      final diaryEntry = {
        'user_id': 1, // Replace with actual user ID
        'date':
            '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}', // Format date
        'content': diaryContent,
        'emotion_score': emotionScore,
      };

      // Create diary entry and capture the response
      final diaryResult = await diaryRepository.createDiaryEntry(diaryEntry);
      LogUtil.d(tag, 'submitDiaryEntry. diaryResult: $diaryResult');

      if (diaryResult is DataSuccess) {
        // Extract entry_id from the diaryResult
        int entryId =
            diaryResult.data?.entryId ?? 0; // Use a default value if null

        for (int i = 0; i < questions.length; i++) {
          await answerRepository.createAnswer({
            'entry_id': entryId, // Use the captured entry_id
            'question_id': questions[i].id,
            'answer_text': answers[i],
          });
        }
        LogUtil.i(tag, 'Diary entry and answers submitted successfully.');
      } else {
        LogUtil.e(tag, 'Failed to create diary entry: ${diaryResult.error}');
      }
    } catch (e) {
      LogUtil.e(tag, 'Error submitting diary entry: $e');
    }
  }
}
