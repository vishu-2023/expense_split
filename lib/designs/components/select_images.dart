import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

Widget selectIcon(
  String icon, {
  double? width,
  Color? color,
  void Function()? onPressed,
  EdgeInsetsGeometry? padding = EdgeInsets.zero,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: SvgPicture.asset(
      icon,
      width: width,
      color: color,
      height: width,
    ),
  );
}
