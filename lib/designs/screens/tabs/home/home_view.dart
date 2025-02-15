import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:split_expense/designs/components/app_button.dart';
import 'package:split_expense/designs/components/app_viewall_row.dart';
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
              children: [
                OptionCard(),
                SizedBox(height: 8),
                ViewAllRow(
                  title: 'Split Bill History',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 8,
                ),
                SplitHistoryListView()
              ],
            ),
          ));
    });
  }
}

// first Card
class OptionCard extends StatelessWidget {
  const OptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          showShadow: false,
          backgroundColor: black,
          border: Border.all(color: context.theme.dividerColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OptionBox(
              bgColor: softOrange,
              title: 'Transfer',
              icon: AppIcons.transfer,
              onPressed: () {},
            ),
            OptionBox(
              bgColor: softBlue,
              title: 'Request',
              icon: AppIcons.transfer,
              onPressed: () {},
            ),
            OptionBox(
              bgColor: softPurple,
              title: 'Split Bill',
              icon: AppIcons.splitBill,
              onPressed: () {},
            ),
            OptionBox(
              bgColor: softPink,
              title: 'More',
              icon: AppIcons.moreOption,
              onPressed: () {},
            )
          ],
        )
      ],
    ).appContainer(borderRadius: 0, hm: 0);
  }
}

// feature options card
class OptionBox extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String icon;
  final Color bgColor;
  const OptionBox(
      {super.key,
      required this.title,
      required this.icon,
      required this.bgColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
          width: 70,
          height: 95,
          child: Column(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                      height: 25,
                      width: 60,
                      child: selectIcon(icon, color: bgColor.withOpacity(0.5)))
                  .appContainer(backgroundColor: white, hm: 0, borderRadius: 0),
              Text(
                title,
                style: TextThemeX().text14.copyWith(fontSize: 12).medium,
              )
            ],
          )).appContainer(
        hm: 0,
        hp: 4,
        vp: 4,
        borderRadius: 0,
        backgroundColor: bgColor.withOpacity(0.1),
      ),
    );
  }
}

//second card listview
class SplitHistoryListView extends StatelessWidget {
  const SplitHistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return HistoryViewCard();
        },
      ),
    );
  }
}

//second card detail
class HistoryViewCard extends StatelessWidget {
  const HistoryViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                child: Text(""),
              ),
              SizedBox(width: 8),
              Text(
                "Burger Queen",
                style: TextThemeX().text14,
              ),
              Spacer(),
              Text(
                "10000 usd",
                style: TextThemeX().text14.semiBold,
              )
            ],
          ),
          Divider(
            color: strokeColor,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 40,
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 16,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 16,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    "80%",
                    style: TextThemeX().text14.copyWith(color: softOrange, fontSize: 12),
                  ),
                  Text(
                    "paid",
                    style: TextThemeX().text14.copyWith(fontSize: 12),
                  )
                ],
              )
            ],
          ),
          Divider(
            color: strokeColor,
          ),
          Row(
            children: [
              Text(
                "0ct 10, 2024",
                style: TextThemeX().text14.copyWith(fontSize: 12, color: iconColor),
              ),
              Spacer(),
              AppButton(
                label: "View Deatils",
                backgroundColor: surface,
                borderColor: black,
                borderRadius: 24,
                height: 20,
                width: 90,
                labelFontSize: 9,
              ),
            ],
          ),
          SizedBox(height: 12),
        ],
      ).appContainer(hp: 8, vp: 0, hm: 6, borderRadius: 0, showShadow: true),
    );
  }
}
