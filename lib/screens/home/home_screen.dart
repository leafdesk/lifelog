import 'package:flutter/material.dart';
import 'package:lifelog/screens/home/diary/diary_entry_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
import 'package:lifelog/screens/home/home_controller.dart';
import 'package:lifelog/models/question/question_model.dart';
import 'package:lifelog/models/answer/answer_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _homeController.loadDiaryData(_homeController.selectedDay.value, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _homeController.selectedDay.value,
            selectedDayPredicate: (day) =>
                isSameDay(_homeController.selectedDay.value, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _homeController.updateSelectedDay(selectedDay);
              });
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // 감정 상태
                    Obx(() => Text(
                          '감정 상태: ${_homeController.emotionScore.value}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),

                    const SizedBox(height: 10),

                    // 일기
                    Obx(() => Text(
                          _homeController.content.value,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),

                    const SizedBox(height: 10),

                    // 질문-답변 리스트 추가
                    Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          _homeController.questions.length,
                          (index) {
                            final question = _homeController.questions[index];
                            final answer = _homeController.answers.length >
                                    index
                                ? _homeController.answers[index].answerText
                                : ''; // Handle case where answer might not exist
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '질문: ${question.question ?? '질문 없음'}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '답변: $answer',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.to(() => DiaryEntryScreen(
              selectedDate: _homeController.selectedDay.value));
          if (result == true) {
            // 결과가 true일 때 diary 데이터 새로 고침
            _homeController.loadDiaryData(_homeController.selectedDay.value, 1);
          }
        },
        child: Obx(() {
          return Icon(
            _homeController.content.value.isNotEmpty ? Icons.edit : Icons.add,
          );
        }),
      ),
    );
  }
}
