import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifelog/repositories/statistics_repository.dart';

class StatisticsController extends GetxController {
  final StatisticsRepository statisticsRepository = StatisticsRepository();

  // Observable 변수로 통계 데이터를 저장
  var statisticsData = <int, String>{}.obs;
  var selectedMonth = DateTime.now().month.obs; // 현재 달로 초기화

  // 통계 데이터를 가져오는 메서드
  Future<void> fetchStatistics() async {
    try {
      Map<String, String> fetchedData =
          await statisticsRepository.getStatistics(
        selectedMonth.value,
        2024,
        ['emotion'],
      );

      // Convert fetchedData to Map<int, String>
      statisticsData.value =
          fetchedData.map((key, value) => MapEntry(int.parse(key), value));
      debugPrint("statisticsData: ${statisticsData.value}");
    } catch (e) {
      // 오류 처리
      debugPrint("통계 데이터를 가져오는 중 오류 발생: $e");
    }
  }
}
