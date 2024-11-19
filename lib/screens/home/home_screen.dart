import 'package:flutter/material.dart';
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
              _homeController.updateSelectedDay(selectedDay);
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
                          '감정 상태: ${_homeController.mood.value}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),

                    const SizedBox(height: 10),
                    // 일기
                    Obx(() => Text(
                          _homeController.diaryEntry.value,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),

                    const SizedBox(height: 10),
                    // // 사진
                    Obx(() => Text(
                          _homeController.photoUrl.value,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),

                    // Obx(() => Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         Image.network(_homeController.photoUrl.value,
                    //             width: 60, height: 60),
                    //         Image.network(_homeController.photoUrl.value,
                    //             width: 60, height: 60),
                    //         Image.network(_homeController.photoUrl.value,
                    //             width: 60, height: 60),
                    //       ],
                    //     )),

                    const SizedBox(height: 10),
                    // 사용자 지정 질문

                    Obx(() => Text(_homeController.customQuestion.value,
                        style: const TextStyle(fontSize: 16))),
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
