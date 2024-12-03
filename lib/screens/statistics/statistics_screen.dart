import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // pub.dev에서 fl_chart 패키지 추가 필요
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

  String selectedMonth = '10월';

  @override
  void initState() {
    super.initState();
    _statisticsController.loadStatisticsData();
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
            child: DropdownButton<String>(
              value: selectedMonth,
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
                  setState(() {
                    selectedMonth = newValue;
                  });
                }
              },
            ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildEmotionStat('😊', '행복', _statisticsController.statisticsData.value['1']),
              _buildEmotionStat('🤪', '즐거움', _statisticsController.statisticsData.value['2']),
              _buildEmotionStat('😐', '보통임', _statisticsController.statisticsData.value['3']),
              _buildEmotionStat('😢', '슬픔', _statisticsController.statisticsData.value['4']),
              _buildEmotionStat('😠', '화남', _statisticsController.statisticsData.value['5']),
            ],
          ),

          const SizedBox(height: 24),

          // 막대 그래프
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 30,
                barGroups: [
                  _buildBarGroup(0, 20), // 행복
                  _buildBarGroup(1, 19), // 즐거움
                  _buildBarGroup(2, 25), // 보통
                  _buildBarGroup(3, 15), // 슬픔
                  _buildBarGroup(4, 2), // 화남
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

          // 가장 많이 한 루틴 TOP 3
          const Text(
            '가장 많이 한 루틴 TOP 3',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildRoutineItem('1. 명상하기', '30회'),
          _buildRoutineItem('2. 요리하기', '22회'),
          _buildRoutineItem('3. 독서하기', '21회'),

          const SizedBox(height: 24),

          // 수면 루틴
          const Text(
            '수면 루틴',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildSleepRoutineGrid(),
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

  Widget _buildRoutineItem(String title, String count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(count, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildSleepRoutineGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 2.5,
      children: [
        _buildSleepRoutineItem('평균 수면 시간', '7.2시간', Icons.bedtime),
        _buildSleepRoutineItem('평균 취침 시간', '22:56', Icons.nights_stay),
        _buildSleepRoutineItem('평균 기상 시간', '06:25', Icons.wb_sunny),
        _buildSleepRoutineItem('수면 기록 일수', '29일', Icons.calendar_today),
      ],
    );
  }

  Widget _buildSleepRoutineItem(String title, String value, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 16, color: Colors.blue),
                const SizedBox(width: 4),
                Text(title,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 4),
            Text(value,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
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
