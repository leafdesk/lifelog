import 'package:get/get.dart';
import 'package:lifelog/repositories/diary_repository.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:lifelog/models/diary/diary_entry_model.dart';
import 'package:lifelog/utils/log_util.dart';
import 'package:lifelog/models/question/question_model.dart';
import 'package:lifelog/models/answer/answer_model.dart';
import 'package:lifelog/repositories/answer_repository.dart';
import 'package:lifelog/repositories/custom_question_repository.dart';

class HomeController extends GetxController {
  final DiaryRepository diaryRepository = DiaryRepository();
  final AnswerRepository answerRepository = AnswerRepository();
  final String tag = 'HomeController';

  /// 일기 내용
  var content = ''.obs;

  /// 감정 점수
  var emotionScore = ''.obs;

  /// 달력에서 선택된 날짜
  var selectedDay = DateTime.now().obs; // 현재 날짜로 초기화

  /// 질문 목록
  var questions =
      <QuestionModel>[].obs; // Define questions as an observable list

  /// 답변 목록
  var answers = <AnswerModel>[].obs; // Define answers as an observable list

  /// 날짜 업데이트 메서드
  /// param: day - 선택된 날짜
  /// return: void
  void updateSelectedDay(DateTime day) {
    selectedDay.value = day;
    loadDiaryData(day, 1); // 예시로 userId를 1로 설정
  }

  /// 날짜를 매개변수로 받아서 일기 데이터를 로드하는 함수
  Future<void> loadDiaryData(DateTime date, int userId) async {
    try {
      String formattedDate =
          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      final result = await diaryRepository.getDiaryEntryByUserAndDate(
          userId, formattedDate);

      if (result is DataSuccess<DiaryEntryModel>) {
        final entry = result.data;
        content.value = entry?.content ?? '';
        emotionScore.value = entry?.emotionScore ?? '';

        // Fetch questions and answers for the diary entry
        final answersResult =
            await answerRepository.getAnswersByEntryId(entry?.entryId ?? 0);
        if (answersResult is DataSuccess<List<AnswerModel>>) {
          // Fetch questions associated with the user
          final questionsResult =
              await CustomQuestionRepository().getCustomQuestionsByUser(userId);
          if (questionsResult is DataSuccess<List<QuestionModel>>) {
            questions.assignAll(
                questionsResult.data ?? []); // Correctly assign questions
          }
          answers
              .assignAll(answersResult.data ?? []); // Correctly assign answers
        }
      } else {
        content.value = '';
        emotionScore.value = '';
        LogUtil.i(tag, "loadDiaryData. No Content");
      }
    } catch (e) {
      LogUtil.e(tag, "loadDiaryData. Exception: $e");
    }
  }
}
