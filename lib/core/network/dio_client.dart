import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options.baseUrl = "https://api.escuelajs.co/api/v1";
  }

  Dio get dio {
    return _dio;
  }
}
