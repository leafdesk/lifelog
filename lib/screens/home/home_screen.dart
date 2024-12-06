import 'package:flutter/material.dart';
import 'package:lifelog/screens/home/diary/diary_entry_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
import 'package:lifelog/screens/home/home_controller.dart';

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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => DiaryEntryScreen(
              selectedDate: _homeController.selectedDay.value));
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
