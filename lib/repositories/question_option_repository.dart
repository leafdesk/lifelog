import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lifelog/data/remote/lifelog_api.dart';
import 'package:lifelog/models/question/question_option_model.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:lifelog/utils/dio_provider.dart';

class QuestionOptionRepository {
  static String tag = "QuestionOptionRepository";
  static final QuestionOptionRepository _instance =
      QuestionOptionRepository._internal();
  late LifeLogApi _lifeLogApi;

  factory QuestionOptionRepository() => _instance;

  QuestionOptionRepository._internal() {
    _lifeLogApi = LifeLogApi(DioProvider.dio);
  }

  Future<DataState<QuestionOptionModel>> getQuestionOption(int optionId) async {
    try {
      final option = await _lifeLogApi.getQuestionOption(optionId);
      return DataSuccess(option);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<QuestionOptionModel>> createQuestionOption(
      Map<String, dynamic> option) async {
    try {
      final newOption = await _lifeLogApi.createQuestionOption(option);
      return DataSuccess(newOption);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<QuestionOptionModel>> updateQuestionOption(
      int optionId, Map<String, dynamic> option) async {
    try {
      final updatedOption =
          await _lifeLogApi.updateQuestionOption(optionId, option);
      return DataSuccess(updatedOption);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<void>> deleteQuestionOption(int optionId) async {
    try {
      await _lifeLogApi.deleteQuestionOption(optionId);
      return const DataSuccess(null);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }
}
