import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifelog/screens/home/home_controller.dart';
import 'package:lifelog/screens/home/diary/diary_entry_controller.dart';
import 'package:lifelog/repositories/answer_repository.dart';
import 'package:lifelog/utils/data_state.dart';

class DiaryEntryScreen extends StatefulWidget {
  const DiaryEntryScreen({super.key});

  @override
  State<DiaryEntryScreen> createState() => _DiaryEntryScreenState();
}

class _DiaryEntryScreenState extends State<DiaryEntryScreen> {
  final HomeController _homeController = Get.find();
  final DiaryEntryController _diaryEntryController =
      Get.put(DiaryEntryController());
  final TextEditingController _diaryContentController = TextEditingController();
  int? _selectedEmotionScore;

  @override
  void initState() {
    super.initState();
    // 질문 로드
    _diaryEntryController.loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일기 작성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('감정 점수 선택 (1-5):'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedEmotionScore = index + 1;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: _selectedEmotionScore == index + 1
                        ? Colors.blue
                        : Colors.grey,
                    child: Text('${index + 1}'),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            const Text('질문 선택:'),
            Obx(() {
              return DropdownButton<int>(
                hint: const Text('질문을 선택하세요'),
                items: _diaryEntryController.questions.map((question) {
                  return DropdownMenuItem<int>(
                    value: question.id,
                    child: Text(question.question ?? ''),
                  );
                }).toList(),
                onChanged: (value) {
                  _diaryEntryController.currentQuestion.value =
                      value.toString();
                },
              );
            }),
            const SizedBox(height: 20),
            const Text('일기 내용:'),
            TextField(
              controller: _diaryContentController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '일기를 작성하세요...',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_selectedEmotionScore != null &&
                    _diaryContentController.text.isNotEmpty) {
                  // 일기 등록 API 호출
                  final diaryEntry = {
                    'emotion_score': _selectedEmotionScore,
                    'content': _diaryContentController.text,
                  };
                  final result = await _homeController.diaryRepository
                      .createDiaryEntry(diaryEntry);

                  if (result is DataSuccess) {
                    // 질문에 대한 답변 등록
                    final answer = {
                      'question_id': _diaryEntryController
                          .currentQuestion.value, // 선택된 질문 ID
                      'answer_text': _diaryContentController.text,
                    };
                    await AnswerRepository().createAnswer(answer);
                    Get.back(); // 이전 페이지로 돌아가기
                  } else {
                    // 에러 처리
                  }
                }
              },
              child: const Text('작성 완료'),
            ),
          ],
        ),
      ),
    );
  }
}
