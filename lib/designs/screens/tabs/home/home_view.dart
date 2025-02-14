import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
              AppIcons.notification.appCircleIconButton(onPressed: () {
                Navigator.canPop(context);
              })
            ],
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: TextThemeX().text14.copyWith(color: iconColor),
                ),
                Text(
                  "Vishu ✌️",
                  style: TextThemeX().text16.semiBold,
                )
              ],
            ),
          ),
          body: Center(
              child: Text(
            "home",
          )));
    });
  }
}
