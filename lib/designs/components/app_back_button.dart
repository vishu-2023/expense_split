import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:split_expense/utils/app_assets.dart';
import 'package:split_expense/utils/app_colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: IconButton(
        onPressed: () {
          Navigator.maybePop(context);
        },
        icon: SvgPicture.asset(
          AppIcons.backArrow,
          matchTextDirection: true,
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
