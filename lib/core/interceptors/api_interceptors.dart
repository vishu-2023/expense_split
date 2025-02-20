import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;

import '../routes/app_pages.dart';

part 'logging_interceptors.dart';

class ApiInterceptor implements Interceptor {
  ApiInterceptor._();
  factory ApiInterceptor() => _instance;
  static final ApiInterceptor _instance = ApiInterceptor._();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _attachAuthToken(options);
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // If the error is 401, logout the user
    if (err.response?.statusCode == 401 && Get.currentRoute != Routes.LOGIN) {
      // Get.find<AuthRepository>().logout();
      Get.offAllNamed(Routes.LOGIN);
    }
    return handler.next(err);
  }

  void _attachAuthToken(RequestOptions options) async {
    if (!options.extra.containsKey("requiresToken") || !options.extra['requiresToken']) return;

    options.extra.remove("requiresToken");

    // final String? apiKey = GSServices.getUser?.keyDetails?.apiKey;
    // final String? apiSecret = GSServices.getUser?.keyDetails?.apiSecret;

    // options.headers.addAll({"Authorization": 'token $apiKey:$apiSecret'});
  }
}
