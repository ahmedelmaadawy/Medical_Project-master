import 'package:dio/dio.dart';

class DioHelper {
  static Dio? localserverdio;

  static init() {
    localserverdio = Dio(
      BaseOptions(
        baseUrl: "http:///192.168.43.113:8000",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? queryPara,
  }) async {
    return await localserverdio!.get(path, queryParameters: queryPara);
  }
}
