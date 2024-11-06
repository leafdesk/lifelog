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
      body: Obx(() {
        return Center(child: numberControl(homeController: _homeController));
      }),
    );
  }
}

/// 숫자 컨트롤 위젯.
Widget numberControl({required HomeController homeController}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('숫자: ${homeController.number.value}'),
      ElevatedButton(
        onPressed: () {
          homeController.increaseNumber();
        },
        child: const Text('+'),
      ),
      ElevatedButton(
        onPressed: () {
          homeController.decreaseNumber();
        },
        child: const Text('-'),
      ),
    ],
  );
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final HomeController homeController = Get.put(HomeController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           TableCalendar(
//             firstDay: DateTime.utc(2020, 1, 1),
//             lastDay: DateTime.utc(2030, 12, 31),
//             focusedDay: homeController.selectedDay.value,
//             selectedDayPredicate: (day) =>
//                 isSameDay(homeController.selectedDay.value, day),
//             onDaySelected: (selectedDay, focusedDay) {
//               homeController.updateSelectedDay(selectedDay);
//             },
//           ),
//           const SizedBox(height: 20),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     // 감정 상태
//                     Obx(() => Text(
//                           '감정 상태: ${homeController.mood.value}',
//                           style: const TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         )),
//                     const SizedBox(height: 10),
//                     // 일기
//                     Obx(() => Text(
//                           '일기:',
//                           style: const TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         )),
//                     Obx(() => Text(
//                           homeController.diaryEntry.value,
//                           style: const TextStyle(fontSize: 16),
//                         )),
//                     const SizedBox(height: 10),
//                     // 사진
//                     Obx(() => Text(
//                           '사진:',
//                           style: const TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         )),
//                     Obx(() => Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Image.network(homeController.photoUrl.value,
//                                 width: 60, height: 60),
//                             Image.network(homeController.photoUrl.value,
//                                 width: 60, height: 60),
//                             Image.network(homeController.photoUrl.value,
//                                 width: 60, height: 60),
//                           ],
//                         )),
//                     const SizedBox(height: 10),
//                     // 사용자 지정 질문
//                     Obx(() => Text(
//                           '사용자 지정 질문:',
//                           style: const TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         )),
//                     Obx(() => Text(homeController.customQuestion.value,
//                         style: const TextStyle(fontSize: 16))),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
