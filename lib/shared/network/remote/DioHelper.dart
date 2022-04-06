import 'package:dio/dio.dart';
import 'package:store/shared/constants.dart';

class DioHelper {
  static late Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData({
    required url,
    query
  }) async {
    var data = await dio!.get(
      url,
      queryParameters: query
    );
    return data;
  }
}