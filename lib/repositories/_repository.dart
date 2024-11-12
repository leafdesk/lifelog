// import 'package:lifelog/data/remote/lifelog_api.dart';
// import 'package:lifelog/utils/dio_provider.dart';

class LifeLogRepository {
  static String tag = "LifeLogRepository";
  static final LifeLogRepository _instance = LifeLogRepository._internal();
  // late LifeLogApi _lifeLogApi;

  factory LifeLogRepository() => _instance;

  LifeLogRepository._internal() {
    // _lifeLogApi = LifeLogApi(DioProvider.dio);
  }
}
