// import 'package:lifelog/data/remote/lifelog_api.dart';
// import 'package:lifelog/utils/dio_provider.dart';

class TempRepository {
  static String tag = "TempRepository";
  static final TempRepository _instance = TempRepository._internal();
  // late LifeLogApi _lifeLogApi;

  factory TempRepository() => _instance;

  TempRepository._internal() {
    // _lifeLogApi = LifeLogApi(DioProvider.dio);
  }
}
