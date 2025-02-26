import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:split_expense/core/services/helpers.dart';
import 'package:split_expense/utils/app_constant.dart';

part 'api_exceptions.dart';

mixin BaseService {
  // i.e. .v1, .v2
  final String apiVersion = '.v1';

  final Map<String, dynamic> requiresToken = {"requiresToken": true};
  static final Dio _dio = DioX().getDio(basUrl);
  Dio get dio => _dio;

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
