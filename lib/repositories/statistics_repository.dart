import 'package:lifelog/data/remote/lifelog_api.dart';
import 'package:lifelog/utils/dio_provider.dart';

class StatisticsRepository {
  static String tag = "StatisticsRepository";
  static final StatisticsRepository _instance =
      StatisticsRepository._internal();
  late LifeLogApi _lifeLogApi;

  factory StatisticsRepository() => _instance;

  StatisticsRepository._internal() {
    _lifeLogApi = LifeLogApi(DioProvider.dio);
  }

  Future<Map<String, String>> getStatistics(
      int month, int year, List<String> type) async {
    return _lifeLogApi.getStatistics(month, year, type);
  }
}
