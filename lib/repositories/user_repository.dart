import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lifelog/data/remote/lifelog_api.dart';
import 'package:lifelog/models/user/user_model.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:lifelog/utils/dio_provider.dart';
import 'package:lifelog/utils/log_util.dart';

class UserRepository {
  static String tag = "UserRepository";
  static final UserRepository _instance = UserRepository._internal();
  late LifeLogApi _lifeLogApi;

  factory UserRepository() => _instance;

  UserRepository._internal() {
    _lifeLogApi = LifeLogApi(DioProvider.dio);
  }

  Future<DataState<UserModel>> getUser(int userId) async {
    LogUtil.d(tag, "getUser. userId: $userId");
    try {
      final userInfo = await _lifeLogApi.getUser(userId);
      return DataSuccess(userInfo);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<UserModel>> createUser(Map<String, dynamic> user) async {
    try {
      final newUser = await _lifeLogApi.createUser(user);
      return DataSuccess(newUser);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<UserModel>> updateUser(
      int userId, Map<String, dynamic> user) async {
    try {
      final updatedUser = await _lifeLogApi.updateUser(userId, user);
      return DataSuccess(updatedUser);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<void>> deleteUser(int userId) async {
    try {
      await _lifeLogApi.deleteUser(userId);
      return const DataSuccess(null);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }
}
