import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.now();
  String mood = "좋음"; // 감정 상태
  String diaryEntry = "오늘은 정말 좋은 하루였습니다. 친구들과 함께 시간을 보내며 많은 이야기를 나눴어요."; // 일기
  String photoUrl = "https://via.placeholder.com/150"; // 사진 URL
  String customQuestion = "오늘 가장 감사했던 순간은?"; // 사용자 지정 질문

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: selectedDay,
            selectedDayPredicate: (day) => isSameDay(selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                this.selectedDay = selectedDay;
              });
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // 감정 상태
                    Text(
                      '감정 상태: $mood',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    // 일기
                    Text(
                      '일기:',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      diaryEntry,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    // 사진
                    Text(
                      '사진:',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(photoUrl, width: 60, height: 60),
                        Image.network(photoUrl, width: 60, height: 60),
                        Image.network(photoUrl, width: 60, height: 60),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // 사용자 지정 질문
                    Text(
                      '사용자 지정 질문:',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(customQuestion, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
