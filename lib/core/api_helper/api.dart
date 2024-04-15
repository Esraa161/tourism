import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'http://circleserp.cloud:2060/',
        receiveDataWhenStatusError: true,
        headers: {}));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic>? query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url, required Map<String, dynamic>? data}) async {
    return await dio!.post(url, data: data);
  }
}
