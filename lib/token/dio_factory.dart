import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cash_helper.dart';
class DioFactory {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://real-estates-test.000webhostapp.com/public/api/",
    receiveTimeout: const Duration(seconds: 8),
    connectTimeout: const Duration(seconds: 9),
  ));
  DioFactory._() {
    _dio.interceptors.addAll(<Interceptor>{
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        // final prefs = await SharedPreferences.getInstance();
        // String? token = prefs.getString('token');
        // options.headers = {'Authorization': 'Bearer$token'};
        // options.headers["Authorization"] = "Bearer" + token!;
        options.headers['Authorization'] = 'Bearer 1|ZvZuHMr87OzFaime4pRBmatN2o3T8N86PN8RSKLV';
        options.headers['content-Type']='application/json';
        // options.headers['Authorization'] = 'Bearer ${CachHelper.sharedPreferences.getString('token')}';
        // Options(
        //   validateStatus: (_) => true,
        //   contentType: Headers.jsonContentType,
        //   responseType: ResponseType.json,
        // );
        return handler.next(options);
      }),
      LogInterceptor(
        responseBody: true,
      )
    });
  }
  static DioFactory instance = DioFactory._();
  Dio get() {
    return _dio;
  }
}
