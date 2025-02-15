import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

extension DateTimeE7n on DateTime {
  /// yyyy-MM-dd
  String get getDefaultDateFormat => DateFormat('yyyy-MM-dd').format(this);

  /// yyyy-MM-dd hh:mm a
  String get getDefaultDateTimeFormat => DateFormat('yyyy-MM-dd').add_jm().format(this);
}

extension TextWeight on TextStyle {
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
}
