import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_expense/designs/screens/startup/signup_view_controller.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupViewController>(builder: (controller) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Work in Progress"),
              Text("Please check the get otp and verify otp screens smoothness"),
              Text("Ui will change by us")
            ],
          ).paddingSymmetric(horizontal: 16),
        ),
      );
    });
  }
}
