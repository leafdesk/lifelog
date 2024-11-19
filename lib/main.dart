import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifelog/app_controller.dart';
import 'package:lifelog/screens/home/home_screen.dart';
import 'package:lifelog/screens/settings_screen.dart';
import 'package:lifelog/screens/statistics_screen.dart';

void main() {
  runApp(const LifeLogApplication());
}

class LifeLogApplication extends StatelessWidget {
  const LifeLogApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Life-Log App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  // 각 페이지를 담을 리스트
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const StatisticsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // AppController 인스턴스를 생성하여 사용
    final AppController controller = Get.put(AppController());

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Bible App'),
      // ),
      body: Obx(
        () => _widgetOptions.elementAt(controller.currentIndex.value),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph),
              label: '통계',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '설정',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: controller.changeScreenIndex,
        ),
      ),
    );
  }
}
