import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lifelog/data/remote/lifelog_api.dart';
import 'package:lifelog/models/photo/photo_model.dart';
import 'package:lifelog/utils/data_state.dart';
import 'package:lifelog/utils/dio_provider.dart';

class PhotoRepository {
  static String tag = "PhotoRepository";
  static final PhotoRepository _instance = PhotoRepository._internal();
  late LifeLogApi _lifeLogApi;

  factory PhotoRepository() => _instance;

  PhotoRepository._internal() {
    _lifeLogApi = LifeLogApi(DioProvider.dio);
  }

  Future<DataState<PhotoModel>> getPhoto(int photoId) async {
    try {
      final photo = await _lifeLogApi.getPhoto(photoId);
      return DataSuccess(photo);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<List<PhotoModel>>> getAllPhotos() async {
    try {
      final photos = await _lifeLogApi.getAllPhotos();
      return DataSuccess(photos);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

  Future<DataState<PhotoModel>> createPhoto(Map<String, dynamic> photo) async {
    try {
      final newPhoto = await _lifeLogApi.createPhoto(photo);
      return DataSuccess(newPhoto);
    } on DioException catch (e) {
      debugPrint("$e");
      return DataFailed(e);
    } catch (e) {
      return DataLocalFailed(e.toString());
    }
  }

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
}
