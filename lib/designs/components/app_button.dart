import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_expense/utils/app_colors.dart';
import 'package:split_expense/utils/app_text_theme.dart';

class AppButton extends StatelessWidget {
  /// if not specified, [defaultHeight] will be used
  ///
  /// if [null], the button will take the height of its child
  final double? height;
  final double? width;
  final String? label;
  final Widget? child;
  final bool isLoading;
  final Widget? leading;
  final Widget? trailing;
  final Color? labelColor;
  final Color? loaderColor;
  final ShapeBorder? shape;
  final Color? borderColor;

  /// defaultLabelFontSize = 16.0
  final double labelFontSize;

  /// defaultBorderRadius = 32.0
  final double borderRadius;
  final FontWeight fontWeight;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  /// The internal padding for the button's [child].
  ///
  /// Defaults to the value from the current [ButtonTheme],
  /// [ButtonThemeData.padding].
  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    this.child,
    this.label,
    this.width,
    this.shape,
    this.padding,
    this.leading,
    this.trailing,
    this.onPressed,
    this.labelColor,
    this.borderColor,
    this.loaderColor,
    this.backgroundColor,
    this.isLoading = false,
    this.height = defaultHeight,
    this.fontWeight = FontWeight.w500,
    this.borderRadius = defaultBorderRadius,
    this.labelFontSize = defaultLabelFontSize,
  }) : assert(label != null || child != null, 'title or child must be provided');

  ///52.0
  static const defaultHeight = 52.0;

  /// 32.0
  static const defaultBorderRadius = 32.0;

  ///16.0
  static const defaultLabelFontSize = 16.0;

  static Widget loader({Color? color}) {
    return SizedBox.square(
      dimension: 15,
      child: Builder(builder: (context) {
        return CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? white),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget child;
    final Color labelLoaderColor = labelColor ?? context.textTheme.labelLarge!.color!;

    final Color effectiveLoaderColor = loaderColor ?? labelLoaderColor;

    if (isLoading) {
      child = loader(color: effectiveLoaderColor);
    } else if (this.child != null) {
      child = this.child!;
    } else {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) leading!,
          Text(
            label!,
            style: TextThemeX().text16.copyWith(
                  letterSpacing: 0,
                  fontWeight: fontWeight,
                  fontSize: labelFontSize,
                  color: labelLoaderColor,
                ),
          ),
          if (trailing != null) trailing!,
        ],
      );
    }

    final ShapeBorder? shape;
    if (this.shape != null) {
      shape = this.shape;
    } else {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: borderColor != null ? BorderSide(color: borderColor!) : BorderSide.none,
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        minWidth: 0,
        shape: shape,
        elevation: 0,
        height: height,
        padding: padding,
        onPressed: onPressed,
        highlightElevation: 0,
        color: backgroundColor,
        disabledColor: backgroundColor?.withOpacity(0.5),
        child: child,
      ),
    );
  }
}
