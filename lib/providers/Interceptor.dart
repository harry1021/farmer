import 'package:dio/dio.dart';

class Intercept {
  String? authToken;
  String? userId;
  Dio? dio = Dio();
  Intercept(authToken) {
    this.authToken = authToken;
    //this.userId = userId;
    dio!.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      options.headers["X-Access-Token"] = authToken;
      options.headers["Authorization"] = "Bearer " + authToken.toString();
      options.headers["Content-Type"] = "application/json";
      options.headers['X-Current-Time'] = 0;
      options.headers['Accept'] = "application/json";
      return options;
    }, onResponse: (Response response) async {
      return response; // continue
    }, onError: (DioError e) async {
      return e; //continue
    }));
  }
}