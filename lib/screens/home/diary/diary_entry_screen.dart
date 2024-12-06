import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifelog/screens/home/diary/diary_entry_controller.dart';

class DiaryEntryScreen extends StatefulWidget {
  final DateTime selectedDate;

  const DiaryEntryScreen({super.key, required this.selectedDate});

  @override
  State<DiaryEntryScreen> createState() => _DiaryEntryScreenState();
}

class _DiaryEntryScreenState extends State<DiaryEntryScreen> {
  final DiaryEntryController _diaryEntryController =
      Get.put(DiaryEntryController());
  final TextEditingController _diaryContentController = TextEditingController();
  int? _selectedEmotionScore;

  @override
  void initState() {
    super.initState();
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
            const Text('질문 목록:'),
            Obx(() {
              return Column(
                children: _diaryEntryController.questions.map((question) {
                  int questionIndex =
                      _diaryEntryController.questions.indexOf(question);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(question.question ?? ''),
                      TextField(
                        onChanged: (value) {
                          _diaryEntryController.answers[questionIndex] =
                              value; // Update the answer
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '답변을 입력하세요...',
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }).toList(),
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
                  await _diaryEntryController.submitDiaryEntry(
                    _selectedEmotionScore,
                    _diaryContentController.text,
                    widget.selectedDate,
                  );
                  Get.back(result: true); // 이전 페이지로 돌아가기
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
