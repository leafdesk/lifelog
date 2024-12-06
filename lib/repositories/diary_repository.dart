import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lifelog/data/remote/lifelog_api.dart';
import 'package:lifelog/models/diary/diary_entry_model.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:lifelog/utils/dio_provider.dart';

class DiaryRepository {
  static String tag = "DiaryRepository";
  static final DiaryRepository _instance = DiaryRepository._internal();
  late LifeLogApi _lifeLogApi;

  factory DiaryRepository() => _instance;

  DiaryRepository._internal() {
    _lifeLogApi = LifeLogApi(DioProvider.dio);
  }

  Future<DataState<DiaryEntryModel>> getDiaryEntry(int entryId) async {
    try {
      final entry = await _lifeLogApi.getDiaryEntry(entryId);
      return DataSuccess(entry);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<List<DiaryEntryModel>>> getAllDiaryEntries() async {
    try {
      final entries = await _lifeLogApi.getAllDiaryEntries();
      return DataSuccess(entries);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<DiaryEntryModel>> createDiaryEntry(
      Map<String, dynamic> entry) async {
    try {
      final newEntry = await _lifeLogApi.createDiaryEntry(entry);
      return DataSuccess(newEntry);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<DiaryEntryModel>> updateDiaryEntry(
      int entryId, Map<String, dynamic> entry) async {
    try {
      final updatedEntry = await _lifeLogApi.updateDiaryEntry(entryId, entry);
      return DataSuccess(updatedEntry);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<void>> deleteDiaryEntry(int entryId) async {
    try {
      await _lifeLogApi.deleteDiaryEntry(entryId);
      return const DataSuccess(null);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  /// 유저 아이디와 날짜를 기준으로 일기 조회
  /// param: userId - 유저 아이디
  /// param: date - 날짜
  /// return: DataState<DiaryEntryModel>
  Future<DataState<DiaryEntryModel>> getDiaryEntryByUserAndDate(
      int userId, String date) async {
    try {
      final entry = await _lifeLogApi.getDiaryEntryByUserAndDate(userId, date);
      return DataSuccess(entry);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }
}
