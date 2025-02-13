import 'package:flutter/material.dart';
import 'package:split_expense/utils/app_colors.dart';

const double appRadius = 12;
const String appFontFamily = "Poppins";
const TextOverflow appTextOverFlow = TextOverflow.ellipsis;
List<BoxShadow> get containerShadow {
  return [BoxShadow(blurRadius: 4, offset: const Offset(0, 4), color: iconColor.withOpacity(0.3))];
}
