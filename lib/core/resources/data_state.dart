import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T ? data;
  final DioException ? error;
  final bool isLoading;
  const DataState({this.data, this.error, this.isLoading = false});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}

class DataLoading<T> extends DataState<T> {
  const DataLoading() : super(isLoading: true);
}
