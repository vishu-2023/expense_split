import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:split_expense/core/repositories/auth_repositories.dart';

class LoginController extends GetxController {
  final _authRepositories = Get.find<AuthRepositories>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  RxBool isSending = false.obs;
  RxBool isVerifying = false.obs;
  GlobalKey<FormState> phoneNumberKey = GlobalKey<FormState>();

  Future<void> sendOtp() async {
    isSending.value = true;
    final response = await _authRepositories.sendOtp(phoneNumber: phoneNumberController.text);
    isSending.value = false;
    if (response!.isSuccess) {
      response.data.successSnackbar();
    }
  }

  Future<void> verifyOtp() async {
    isVerifying.value = true;
    final response = await _authRepositories.verifyOtp(
        phoneNumber: phoneNumberController.text, otp: otpController.text);
    isVerifying.value = false;
    if (response!.isSuccess) {
      response.data.successSnackbar();
    }
  }
}
