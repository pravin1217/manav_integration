import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbonmobility/app/core/constant.dart';

class Client {
  // static String token = "";
  Dio init() {
    Dio dio = Dio();
    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = baseUrl;
    return dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);

    final preference = await SharedPreferences.getInstance();
    const key = 'token';
    var token = preference.getString(key);

    if (token != null) {
      print(token);
      options.headers["Authorization"] = "Bearer $token";
    }
  }
}
