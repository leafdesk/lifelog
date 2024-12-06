import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:lifelog/screens/statistics/statistics_controller.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final StatisticsController _statisticsController =
      Get.put(StatisticsController());

  @override
  void initState() {
    super.initState();
    // 현재 월과 연도의 통계 데이터를 가져옴
    _statisticsController.fetchStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '월별 통계',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '한 달 동안의 감정 변화와 루틴을 확인하세요',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),

          // 월 선택 드롭다운
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Obx(() {
              return DropdownButton<String>(
                value: '${_statisticsController.selectedMonth.value}월',
                isExpanded: true,
                underline: const SizedBox(),
                items: List.generate(12, (index) => '${index + 1}월')
                    .map((String month) => DropdownMenuItem(
                          value: month,
                          child: Text(month),
                        ))
                    .toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    int monthValue = int.parse(newValue.split('월')[0]);
                    _statisticsController.selectedMonth.value = monthValue;
                    _statisticsController.fetchStatistics().then((_) {
                      setState(() {}); // UI 업데이트
                    });
                  }
                },
              );
            }),
          ),

          const SizedBox(height: 24),

          // 감정 통계
          const Text(
            '감정 통계',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // 이모지와 퍼센트
          Obx(() {
            final happyPercentage =
                _statisticsController.statisticsData[5] ?? '0%'; // 5가 행복
            final joyPercentage =
                _statisticsController.statisticsData[4] ?? '0%'; // 4가 즐거움
            final neutralPercentage =
                _statisticsController.statisticsData[3] ?? '0%'; // 3가 보통
            final sadPercentage =
                _statisticsController.statisticsData[2] ?? '0%'; // 2가 슬픔
            final angryPercentage =
                _statisticsController.statisticsData[1] ?? '0%'; // 1이 화남

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildEmotionStat('😊', '행복', happyPercentage),
                _buildEmotionStat('🤪', '즐거움', joyPercentage),
                _buildEmotionStat('😐', '보통임', neutralPercentage),
                _buildEmotionStat('😢', '슬픔', sadPercentage),
                _buildEmotionStat('😠', '화남', angryPercentage),
              ],
            );
          }),

          const SizedBox(height: 24),

          // 원형 그래프
          SizedBox(
            height: 200,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: double.parse(_statisticsController.statisticsData[5]
                            ?.replaceAll('%', '') ??
                        '0'),
                    title: '행복',
                    color: Colors.green,
                  ),
                  PieChartSectionData(
                    value: double.parse(_statisticsController.statisticsData[4]
                            ?.replaceAll('%', '') ??
                        '0'),
                    title: '즐거움',
                    color: Colors.blue,
                  ),
                  PieChartSectionData(
                    value: double.parse(_statisticsController.statisticsData[3]
                            ?.replaceAll('%', '') ??
                        '0'),
                    title: '보통',
                    color: Colors.yellow,
                  ),
                  PieChartSectionData(
                    value: double.parse(_statisticsController.statisticsData[2]
                            ?.replaceAll('%', '') ??
                        '0'),
                    title: '슬픔',
                    color: Colors.orange,
                  ),
                  PieChartSectionData(
                    value: double.parse(_statisticsController.statisticsData[1]
                            ?.replaceAll('%', '') ??
                        '0'),
                    title: '화남',
                    color: Colors.red,
                  ),
                ],
                borderData: FlBorderData(show: false),
                centerSpaceRadius: 40,
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildEmotionStat(String emoji, String label, String percentage) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 4),
        Text(percentage),
      ],
    );
  }
}
