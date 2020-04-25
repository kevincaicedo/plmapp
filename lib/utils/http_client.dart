import 'package:dio/dio.dart';

class HttpClient {
  Dio _dio;
  final String baseUrl;

  Dio get http => _dio;

  HttpClient({this.baseUrl}) {
    this._dio = _client(baseUrl);
  }

  Dio _client(String baseUrl) {
    BaseOptions options = new BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        contentType: 'application/json');

    return Dio(options);
  }
}

extension Methods on HttpClient {
  Future<Response> get(String path) async {
    try {
      return await this.http.get(path);
    } on DioError {
      return null;
    }
  }

  Future<Response> post(String path, Map data) async {
    try {
      return await this.http.post(path, data: data);
    } on DioError {
      return null;
    }
  }

  Future<Response> postWithOptions(
      String path, Map data, Options options) async {
    try {
      return await this.http.post(path, data: data, options: options);
    } on DioError {
      return null;
    }
  }
}
