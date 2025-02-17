import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_expense/designs/components/app_textfield.dart';
import 'package:split_expense/designs/components/select_images.dart';
import 'package:split_expense/designs/screens/startup/login_controller.dart';
import 'package:split_expense/utils/app_assets.dart';
import 'package:split_expense/utils/app_extension.dart';

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
                // labelText: ,
                hintText: "Enter 10 Digit Phone Number",
              )
            ],
          ).paddingSymmetric(horizontal: 16)),
        ),
      );
    });
  }
}
