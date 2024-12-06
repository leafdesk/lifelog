import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lifelog/data/remote/lifelog_api.dart';
import 'package:lifelog/models/answer/answer_model.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:lifelog/utils/dio_provider.dart';

class AnswerRepository {
  static String tag = "AnswerRepository";
  static final AnswerRepository _instance = AnswerRepository._internal();
  late LifeLogApi _lifeLogApi;

  factory AnswerRepository() => _instance;

  AnswerRepository._internal() {
    _lifeLogApi = LifeLogApi(DioProvider.dio);
  }

  Future<DataState<AnswerModel>> getAnswer(int answerId) async {
    try {
      final answer = await _lifeLogApi.getAnswer(answerId);
      return DataSuccess(answer);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<AnswerModel>> createAnswer(
      Map<String, dynamic> answer) async {
    try {
      final newAnswer = await _lifeLogApi.createAnswer(answer);
      return DataSuccess(newAnswer);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<AnswerModel>> updateAnswer(
      int answerId, Map<String, dynamic> answer) async {
    try {
      final updatedAnswer = await _lifeLogApi.updateAnswer(answerId, answer);
      return DataSuccess(updatedAnswer);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<void>> deleteAnswer(int answerId) async {
    try {
      await _lifeLogApi.deleteAnswer(answerId);
      return const DataSuccess(null);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  /// 일기 아이디를 기준으로 답변 조회
  /// param: entryId - 일기 아이디
  /// return: List<AnswerModel>
  Future<DataState<List<AnswerModel>>> getAnswersByEntryId(int entryId) async {
    try {
      final answers = await _lifeLogApi.getAnswersByEntryId(entryId);
      return DataSuccess(answers);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }
}
