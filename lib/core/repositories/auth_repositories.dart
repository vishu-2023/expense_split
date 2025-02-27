import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_expense/core/models/get_user_model.dart';
import 'package:split_expense/core/providers/auth_providers.dart';
import 'package:split_expense/core/services/base_services.dart';
import 'package:split_expense/utils/app_extension.dart';

class AuthRepositories {
  final _authProvider = Get.find<AuthProviders>();

  Future<int?> sendOtp({required String phoneNumber}) async {
    try {
      return _authProvider.sendOtp(phoneNumber: phoneNumber);
    } on BadResponseException catch (e) {
      e.message?.errorSnackbar();
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<GetUserModel> verifyOtp({required String phoneNumber, required String otp}) async {
    try {
      return _authProvider.verifyOtp(phoneNumber: phoneNumber, otp: otp);
    } on BadResponseException catch (e) {
      e.message?.errorSnackbar();
    } catch (e) {
      debugPrint(e.toString());
    }
    return GetUserModel();
  }
}
