import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:split_expense/designs/components/app_button.dart';
import 'package:split_expense/designs/components/select_images.dart';
import 'package:split_expense/designs/screens/tabs/home/home_controller.dart';
import 'package:split_expense/utils/app_assets.dart';
import 'package:split_expense/utils/app_colors.dart';
import 'package:split_expense/utils/app_extension.dart';
import 'package:split_expense/utils/app_text_theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      int hour = DateTime.now().hour;
      return Scaffold(
          appBar: AppBar(
            titleSpacing: 8,
            leading: CircleAvatar(
              backgroundColor: surface,
              child: SvgPicture.asset(
                AppIcons.userBoy,
                fit: BoxFit.cover,
                width: 24,
              ),
            ).paddingOnly(left: 16),
            actions: [
              AppButton(
                padding: EdgeInsets.zero,
                height: 42,
                width: 42,
                backgroundColor: surface,
                child: selectIcon(AppIcons.notification),
              ).paddingOnly(right: 16)
            ],
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hour < 12
                      ? "Good Morning"
                      : hour < 17
                          ? "Good Afternoon"
                          : "Good Evening",
                  style: TextThemeX().text14.copyWith(color: iconColor),
                ),
                Text(
                  "Vishu ✌️",
                  style: TextThemeX().text16.semiBold,
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [OptionCard()],
            ),
          ));
    });
  }
}

class OptionCard extends StatelessWidget {
  const OptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your balance is",
                  style: TextThemeX().text14.copyWith(color: white),
                ),
                Text(
                  "20,000,00",
                  style: TextThemeX().text24.copyWith(color: white).medium,
                ),
              ],
            ),
          ).appContainer(
            vm: 12,
            hp: 8,
            vp: 12,
            hm: 0,
            borderRadius: 8,
            showShadow: false,
            backgroundColor: black,
            border: Border.all(color: context.theme.dividerColor),
          ),
        ],
      ).appContainer(borderRadius: 0, hm: 0),
    );
  }
}
