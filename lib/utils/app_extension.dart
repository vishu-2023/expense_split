import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:split_expense/utils/app_colors.dart';
import 'package:split_expense/utils/app_constant.dart';

extension WidgetExtension on Widget {
  Container appContainer({
    double hp = 16,
    double hm = 16,
    double vp = 16,
    double vm = 0,
    bool showShadow = false,
    BoxBorder? border,
    double borderRadius = appRadius,
    Color? backgroundColor,
  }) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: hp, vertical: vp),
        margin: EdgeInsets.symmetric(horizontal: hm, vertical: vm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor ?? white,
          border: border,
          boxShadow: showShadow ? containerShadow : null,
        ),
        child: this,
      );
}

extension TextWeight on TextStyle {
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
}

extension StringExtension on String {
  Widget appCircleIconButton({
    VoidCallback? onPressed,
  }) {
    return UnconstrainedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: InkWell(
          onTap: onPressed,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: strokeColor),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                this,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
