import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:split_expense/designs/components/app_button.dart';
import 'package:split_expense/designs/screens/startup/login_controller.dart';
import 'package:split_expense/utils/app_colors.dart';
import 'package:split_expense/utils/app_extension.dart';
import 'package:split_expense/utils/app_text_theme.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        body: Form(
          key: controller.phoneNumberKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Text("Sign In", style: TextThemeX().text24.regular),
              SizedBox(height: 4),
              Container(width: 55, color: primary, height: 2),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: "Enter Your Phone Number"),
                controller: controller.phoneNumberController,
              ),
              SizedBox(height: 14),
              Obx(() => AppButton(
                    label: "Get OTP",
                    width: double.infinity,
                    backgroundColor: primary,
                    labelColor: white,
                    isLoading: controller.isSending.value,
                    onPressed: () async {
                      await controller.sendOtp();
                      Get.dialog(OtpPopupView());
                    },
                  ))
            ],
          ).paddingSymmetric(horizontal: 16),
        ),
      );
    });
  }
}

class OtpPopupView extends StatelessWidget {
  const OtpPopupView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          controller.otpController.clear();
          return true;
        },
        child: Center(
            child: Material(
          borderRadius: BorderRadius.circular(8),
          color: surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Verification Code",
                textAlign: TextAlign.center,
                style: TextThemeX().text24.semiBold.copyWith(fontSize: 22),
              ),
              SizedBox(height: 24),
              Text(
                "We've Sent a 6-digit verification code to ${controller.phoneNumberController.text}",
                textAlign: TextAlign.center,
                style: TextThemeX().text16.medium.copyWith(color: iconColor),
              ),
              SizedBox(height: 16),
              Center(
                child: Pinput(
                  length: 4,
                  showCursor: false,
                  controller: controller.otpController,
                  onCompleted: (_) => controller.verifyOtp(),
                  focusedPinTheme: PinTheme(
                      decoration: BoxDecoration(border: Border.all(color: primary)),
                      textStyle: TextThemeX().text16),
                  disabledPinTheme: PinTheme(
                    decoration: BoxDecoration(border: Border.all(color: primary)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "For demo purpose the OTP is ${controller.otp}",
                textAlign: TextAlign.center,
                style: TextThemeX().text16.medium.copyWith(color: iconColor),
              ),
              SizedBox(
                height: 16,
              ),
              Obx(() => AppButton(
                    backgroundColor: primary,
                    width: double.infinity,
                    label: "Verify OTP",
                    isLoading: controller.isVerifying.value,
                    labelColor: white,
                    onPressed: () => controller.verifyOtp(),
                  ))
            ],
          ).paddingSymmetric(horizontal: 16, vertical: 16),
        ).paddingSymmetric(horizontal: 16)),
      );
    });
  }
}
