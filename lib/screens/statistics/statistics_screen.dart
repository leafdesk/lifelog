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
                    _statisticsController
                        .fetchStatistics(); // 월 변경 시 통계 데이터 재요청
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

          // 막대 그래프
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 30,
                barGroups: [
                  _buildBarGroup(
                      0,
                      double.parse(_statisticsController.statisticsData[5] ??
                          '0')), // 행복
                  _buildBarGroup(
                      1,
                      double.parse(_statisticsController.statisticsData[4] ??
                          '0')), // 즐거움
                  _buildBarGroup(
                      2,
                      double.parse(_statisticsController.statisticsData[3] ??
                          '0')), // 보통
                  _buildBarGroup(
                      3,
                      double.parse(_statisticsController.statisticsData[2] ??
                          '0')), // 슬픔
                  _buildBarGroup(
                      4,
                      double.parse(_statisticsController.statisticsData[1] ??
                          '0')), // 화남
                ],
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getTitles,
                      reservedSize: 38,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
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

  BarChartGroupData _buildBarGroup(int x, double value) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: Colors.teal,
          width: 20,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
      ],
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '행복';
        break;
      case 1:
        text = '즐거움';
        break;
      case 2:
        text = '보통';
        break;
      case 3:
        text = '슬픔';
        break;
      case 4:
        text = '화남';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }
}
