import 'package:get/get.dart';
import 'package:lifelog/utils/log_util.dart';
class StatisticsController extends GetxController {
  static String tag = "StatisticsController";
  static StatisticsController get to => Get.find();
  var statisticsData = {}.obs;


  Future<void> loadStatisticsData() async {
    try {
      // 로컬 통계 데이터 설정
      statisticsData.value = {
        "1": "25%",
        "2": "24%",
        "3": "31%",
        "4": "19%",
        "5": "1%"
      };
      // TODO: API에서 데이터 가져옴 
    } catch (e) {
      LogUtil.e(tag,'통계 데이터 로드 중 오류 발생: $e');
    }
  }
}