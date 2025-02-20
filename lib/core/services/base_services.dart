import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

part 'api_exceptions.dart';

mixin BaseService {
  // i.e. .v1, .v2
  final String apiVersion = '.v1';
  final Map<String, dynamic> requiresToken = {"requiresToken": true};

  Future<T> tryOrCatch<T>(Future<T> Function() methodToRun) async {
    try {
      return await methodToRun();
    } on AppException {
      rethrow;
    } on DioException catch (err) {
      throw getErrorMessageForDioErrors(err);
    } catch (e, trace) {
      debugPrint("$e\n$trace");
      throw AppException("Default Exception: ");
    }
  }
}
