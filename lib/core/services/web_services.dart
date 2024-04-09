import 'package:dio/dio.dart';

import '../config/Constants.dart';

class WebService {
  static WebService? _this;
  Dio freeDio = Dio();

  // use singleton pattern to use same object every time
  factory WebService() {
    _this ??= WebService._();
    return _this!;
  }

  WebService._() {
    // use constant base url in dio objects
    freeDio.options.baseUrl = Constants.baseUrl;
    // check time of calling api if > time cancel and give error
    freeDio.options.connectTimeout = const Duration(milliseconds: 30000);
    dioInterceptors();
  }

  dioInterceptors() {
    // clear cached interceptor
    freeDio.interceptors.clear();

    // add interceptor to dio object
    freeDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.headers["Authorization"] = Constants.token;
          options.queryParameters["apiKey"] = Constants.apiKey;
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          return handler.next(error);
        },
      ),
    );
  }
}
