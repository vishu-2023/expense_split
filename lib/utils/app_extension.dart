import 'dart:math' as math;

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:split_expense/utils/app_colors.dart';
import 'package:split_expense/utils/app_constant.dart';
import 'package:split_expense/utils/app_text_theme.dart';

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

extension BuildContextExtension on BuildContext {
  double get topPadding => math.max(statusBarHeight + 15, 15);

  double get bottomPadding => math.max(bottomSafeHeight + 15, 15);

  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;

  double get bottomSafeHeight => MediaQuery.of(this).viewPadding.bottom;
}

extension ResponseE7n on dio.Response {
  bool get isSuccess => statusCode! >= 200 || statusCode! < 300;
}

extension StringExtension on String {
  dynamic errorSnackbar({void Function(GetSnackBar)? onTap}) {
    final colors = softPink.withOpacity(0.5);

    Get
      ..closeAllSnackbars()
      ..rawSnackbar(
        onTap: onTap,
        borderRadius: 16,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 4),
        borderColor: colors,
        backgroundColor: colors,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        icon: CircleAvatar(
          radius: 12,
          backgroundColor: colors,
          // child: SvgPicture.asset(AppSnackbarIcons.error),
        ),
        messageText: Text(
          this,
          overflow: TextOverflow.visible,
          style: TextThemeX().text14.copyWith(
                letterSpacing: 0,
                color: black,
              ),
        ),
      );
  }

  dynamic successSnackbar({void Function(GetSnackBar)? onTap}) {
    final colors = softPurple.withOpacity(0.5);

    Get
      ..closeAllSnackbars()
      ..rawSnackbar(
        onTap: onTap,
        borderRadius: 16,
        snackPosition: SnackPosition.TOP,
        borderColor: colors,
        backgroundColor: colors,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        icon: CircleAvatar(
          radius: 12,
          backgroundColor: colors,
          // child: SvgPicture.asset(AppSnackbarIcons.success),
        ),
        messageText: Text(
          this,
          overflow: TextOverflow.visible,
          style: TextThemeX().text14.copyWith(
                letterSpacing: 0,
                color: black,
              ),
        ),
      );
  }

  dynamic infoSnackbar({void Function(GetSnackBar)? onTap}) {
    final colors = softOrange.withOpacity(0.5);

    Get
      ..closeAllSnackbars()
      ..rawSnackbar(
        onTap: onTap,
        borderRadius: 16,
        snackPosition: SnackPosition.TOP,
        borderColor: colors,
        backgroundColor: colors,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        icon: CircleAvatar(
          radius: 12,
          backgroundColor: iconColor,
          // child: SvgPicture.asset(AppSnackbarIcons.info),
        ),
        messageText: Text(
          this,
          overflow: TextOverflow.visible,
          style: TextThemeX().text14.copyWith(
                letterSpacing: 0,
                color: black,
              ),
        ),
      );
  }
}
