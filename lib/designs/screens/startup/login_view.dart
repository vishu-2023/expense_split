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
                controller: controller.numberController,
              ),
              SizedBox(height: 14),
              AppButton(
                label: "Get Otp",
                backgroundColor: black,
                labelColor: white,
                onPressed: () async {
                  Get.dialog(OtpPopupView());
                },
              )
            ],
          ).paddingSymmetric(horizontal: 16)),
        ),
      );
    });
  }
}

class OtpPopupView extends StatefulWidget {
  const OtpPopupView({super.key});
  @override
  State<OtpPopupView> createState() => _OtpPopupViewState();
}

class _OtpPopupViewState extends State<OtpPopupView> {
  @override
  Widget build(BuildContext context) {
    RxDouble timer = 30.00.obs;
    return Center(
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
          AppButton(
            backgroundColor: black,
            label: "veryfy otp",
            labelColor: white,
            onPressed: () {},
          )
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 8),
    ).paddingSymmetric(horizontal: 16));
  }
}
