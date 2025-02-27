import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_expense/designs/components/app_button.dart';
import 'package:split_expense/designs/components/app_textfield.dart';
import 'package:split_expense/designs/components/select_images.dart';
import 'package:split_expense/designs/screens/startup/login_controller.dart';
import 'package:split_expense/utils/app_assets.dart';
import 'package:split_expense/utils/app_colors.dart';
import 'package:split_expense/utils/app_extension.dart';
import 'package:split_expense/utils/app_text_theme.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
              key: controller.phoneNumberKey,
              child: Column(
                children: [
                  SizedBox(
                    height: context.topPadding + 30,
                  ),
                  selectIcon(AppIcons.userBoy, width: 50),
                  SizedBox(height: 16),
                  AppTextfield(
                    keyboardType: TextInputType.phone,
                    hintText: "Enter 10 Digit Phone Number",
                    controller: controller.phoneNumberController,
                  ),
                  SizedBox(height: 14),
                  Obx(() => AppButton(
                        label: "Get Otp",
                        width: double.infinity,
                        backgroundColor: black,
                        labelColor: white,
                        isLoading: controller.isSending.value,
                        onPressed: () async {
                          await controller.sendOtp();
                          Get.dialog(OtpPopupView());
                        },
                      ))
                ],
              ).paddingSymmetric(horizontal: 16)),
        ),
      );
    });
  }
}

class OtpPopupView extends StatelessWidget {
  const OtpPopupView({super.key});
  @override
  Widget build(BuildContext context) {
    RxDouble timer = 30.00.obs;
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
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "We will send  you a one time password to  your  mobile number",
                textAlign: TextAlign.center,
                style: TextThemeX().text16.medium,
              ),
              SizedBox(height: 24),
              AppTextfield(
                labelText: "Enter Otp",
                controller: controller.otpController,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 16,
              ),
              Obx(() => Text(
                    "You can Resend Otp After $timer Seconds",
                    textAlign: TextAlign.center,
                    style: TextThemeX().text16.medium,
                  )),
              SizedBox(
                height: 16,
              ),
              Obx(() => AppButton(
                    backgroundColor: black,
                    width: double.infinity,
                    label: "veryfy otp",
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
