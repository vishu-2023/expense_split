import 'package:flutter/material.dart';
import 'package:split_expense/designs/components/app_button.dart';
import 'package:split_expense/utils/app_colors.dart';
import 'package:split_expense/utils/app_extension.dart';
import 'package:split_expense/utils/app_text_theme.dart';

class ViewAllRow extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final void Function()? onPressed;
  const ViewAllRow({
    super.key,
    required this.title,
    this.onPressed,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextThemeX()
                .text16
                .copyWith(
                  color: titleColor ?? black,
                )
                .semiBold,
          ),
          const Spacer(),
          if (onPressed != null)
            AppButton(
              height: 32,
              onPressed: onPressed,
              child: Row(
                children: [
                  Text(
                    "See more",
                    style: TextThemeX().text14.copyWith(
                          letterSpacing: 0,
                          color: green,
                        ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
