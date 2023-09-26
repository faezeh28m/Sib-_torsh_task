import 'package:dio/dio.dart';

class API {
  static Future<Response> get(String url) async {
    Dio dio = Dio(
      BaseOptions(
        sendTimeout: const Duration(seconds: 6),
        receiveTimeout: const Duration(seconds: 6),
        connectTimeout: const Duration(seconds: 6),
      ),
    );

    try {
      Response response = await dio.get(url);
      return response;
    } on DioError catch (error) {
      if (error.response == null) {
        return Response(
            requestOptions: RequestOptions(path: ""), statusCode: 500);
      } else {
        return error.response!;
      }
    }
  }

  static Future<Response> post(String url, var body) async {
    Dio dio = Dio(
      BaseOptions(
        sendTimeout: const Duration(seconds: 6),
        receiveTimeout: const Duration(seconds: 6),
        connectTimeout: const Duration(seconds: 6),
      ),
    );

    try {
      Response response = await dio.post(url, data: body);
      return response;
    } on DioError catch (error) {
      if (error.response == null) {
        return Response(
            requestOptions: RequestOptions(path: ""), statusCode: 500);
      } else {
        return error.response!;
      }
    }
  }
}
