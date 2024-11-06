import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lifelog/data/remote/lifelog_api.dart';
import 'package:lifelog/models/question/question_model.dart';
import 'package:lifelog/models/user/user_model.dart';
import 'package:lifelog/models/question/question_option_model.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:lifelog/utils/dio_provider.dart';
import 'package:lifelog/models/diary/diary_entry_model.dart';
import 'package:lifelog/models/photo/photo_model.dart';
import 'package:lifelog/utils/log_util.dart';

class LifeLogRepository {
  static String tag = "LifeLogRepository";
  static final LifeLogRepository _instance = LifeLogRepository._internal();
  late LifeLogApi _lifeLogApi;

  factory LifeLogRepository() => _instance;

  LifeLogRepository._internal() {
    _lifeLogApi = LifeLogApi(DioProvider.dio);
  }

  // 사용자 지정 질문 추가
  Future<DataState<QuestionModel>> addCustomQuestion(
      Map<String, dynamic> question) async {
    try {
      final questionModel = await _lifeLogApi.addCustomQuestion(question);
      return DataSuccess(questionModel); // response를 직접 사용
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  // 사용자 지정 질문 수정
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

  // 사용자 지정 질문 삭제
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

  // 사용자 등록
  Future<DataState<UserModel>> registerUser(Map<String, dynamic> user) async {
    try {
      final newUser = await _lifeLogApi.registerUser(user);
      return DataSuccess(newUser);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  // 사용자 정보 수정
  Future<DataState<UserModel>> updateUser(
      int userId, Map<String, dynamic> user) async {
    try {
      final updatedUser = await _lifeLogApi.updateUser(
          userId.toString(), user); // Convert userId to String
      return DataSuccess(updatedUser);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  // 사용자 정보 조회
  Future<DataState<UserModel>> getUserInfo(int userId) async {
    LogUtil.d(tag, "getUserInfo. userId: $userId");
    try {
      final userInfo = await _lifeLogApi.getUserInfo(userId.toString());
      return DataSuccess(userInfo);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  // 사용자 삭제
  Future<DataState<void>> deleteUser(int userId) async {
    try {
      await _lifeLogApi
          .deleteUser(userId.toString()); // Convert userId to String
      return const DataSuccess(null);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  // 일기 엔트리 추가
  Future<DataState<DiaryEntryModel>> addDiaryEntry(
      Map<String, dynamic> entry) async {
    try {
      final newEntry = await _lifeLogApi.addDiaryEntry(entry);
      return DataSuccess(newEntry);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  // 일기 엔트리 수정
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

  // 일기 엔트리 삭제
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

  // 사진 추가
  Future<DataState<PhotoModel>> addPhoto(Map<String, dynamic> photo) async {
    try {
      final newPhoto = await _lifeLogApi.addPhoto(photo);
      return DataSuccess(newPhoto);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  // 사진 수정
  Future<DataState<PhotoModel>> updatePhoto(
      int photoId, Map<String, dynamic> photo) async {
    try {
      final updatedPhoto = await _lifeLogApi.updatePhoto(photoId, photo);
      return DataSuccess(updatedPhoto);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  // 사진 삭제
  Future<DataState<void>> deletePhoto(int photoId) async {
    try {
      await _lifeLogApi.deletePhoto(photoId);
      return const DataSuccess(null);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  // 질문 옵션 추가
  Future<DataState<QuestionOptionModel>> addQuestionOption(
      Map<String, dynamic> option) async {
    try {
      final newOption = await _lifeLogApi.addQuestionOption(option);
      return DataSuccess(newOption);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  // 질문 옵션 수정
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

  // 질문 옵션 삭제
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
