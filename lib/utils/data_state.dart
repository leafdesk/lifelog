import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;
  final String? localError;

  const DataState({this.data, this.error, this.localError});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}

class DataLocalFailed<T> extends DataState<T> {
  const DataLocalFailed(String error) : super(localError: error);

  @override
  String toString() {
    return 'DataLocalFailed: $localError'; // API 응답 실패 상세 로그 (오류 메시지)
  }
}
