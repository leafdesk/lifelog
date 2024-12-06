import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lifelog/data/remote/lifelog_api.dart';
import 'package:lifelog/models/question/question_model.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:lifelog/utils/dio_provider.dart';

class CustomQuestionRepository {
  static String tag = "CustomQuestionRepository";
  static final CustomQuestionRepository _instance =
      CustomQuestionRepository._internal();
  late LifeLogApi _lifeLogApi;

  factory CustomQuestionRepository() => _instance;

  CustomQuestionRepository._internal() {
    _lifeLogApi = LifeLogApi(DioProvider.dio);
  }

  Future<DataState<QuestionModel>> getCustomQuestion(int questionId) async {
    try {
      final question = await _lifeLogApi.getCustomQuestion(questionId);
      return DataSuccess(question);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<CreateQuestionResponse>> createCustomQuestion(
      Map<String, dynamic> question) async {
    try {
      final newQuestion = await _lifeLogApi.createCustomQuestion(question);
      return DataSuccess(newQuestion);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<QuestionModel>> updateCustomQuestion(
      int questionId, Map<String, dynamic> question) async {
    try {
      final updatedQuestion =
          await _lifeLogApi.updateCustomQuestion(questionId, question);
      return DataSuccess(updatedQuestion);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<void>> deleteCustomQuestion(int questionId) async {
    try {
      await _lifeLogApi.deleteCustomQuestion(questionId);
      return const DataSuccess(null);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<List<QuestionModel>>> getCustomQuestionsByUser(
      int userId) async {
    try {
      final response = await _lifeLogApi.getCustomQuestionsByUser(userId);
      return DataSuccess(response.questions);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }
}
