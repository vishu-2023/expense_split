import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_expense/core/interceptors/api_interceptors.dart';

class DioX {
  DioX._();
  factory DioX() => _internal;
  static final DioX _internal = DioX._();

  Dio _dio(String baseUrl) {
    log("DioX: _dio: $baseUrl");
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: ContentType.json.mimeType,
        validateStatus: (status) => status == 200,
      ),
    );
  }

 
  Dio getDio(String baseUrl) {
    final interceptors = [
      ApiInterceptor(),
      if (!kReleaseMode) LoggingInterceptor(),
      // HTTP Inspector will be not be added if flavor is prod and release mode
      // if (!(kReleaseMode && Config.appFlavor == Flavor.prod))
      //   HttpInspector().alice.getDioInterceptor(),
    ];

    return _dio(baseUrl)..interceptors.addAll(interceptors);
  }
}
//flagconverter for converting true = 1 and 0 = false
class FlagConverter implements JsonConverter<bool, int?> {
  const FlagConverter();

  @override
  bool fromJson(int? json) => switch (json) { 1 => true, _ => false };

  @override
  int? toJson(bool? object) => switch (object) { true => 1, false => 0, null || _ => null };
}