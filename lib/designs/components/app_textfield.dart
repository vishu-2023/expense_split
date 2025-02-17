import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:split_expense/utils/app_colors.dart';
import 'package:split_expense/utils/app_extension.dart';
import 'package:split_expense/utils/app_text_theme.dart';

class AppTextfield extends StatelessWidget {
  final int? maxLength;
  final bool showBorders;
  final Key? formFieldKey;
  final bool readOnly;
  final bool enabled;
  final bool obscureText;
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final double? fontSize;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final Color? textColor;
  final double? borderRadius;
  final String? helperText;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final String? prefixIcon;
  final String? suffixText;
  final double? prefixIconSize;
  final EdgeInsets? contentPadding;
  final void Function()? onTap;
  final Color? hintTextColor;
  final Iterable<String>? autofillHints;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextfield(
      {super.key,
      this.maxLength,
      this.showBorders = true,
      this.formFieldKey,
      this.readOnly = false,
      this.enabled = true,
      this.obscureText = false,
      this.initialValue,
      this.labelText,
      this.hintText,
      this.fontSize,
      this.maxLines,
      this.minLines,
      this.fillColor,
      this.textColor,
      this.borderRadius,
      this.helperText,
      this.textAlign = TextAlign.start,
      this.focusNode,
      this.suffixIcon,
      this.prefixIcon,
      this.suffixText,
      this.prefixIconSize,
      this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      this.onTap,
      this.hintTextColor,
      this.autofillHints,
      this.onSubmit,
      this.onChanged,
      this.textInputAction = TextInputAction.next,
      this.keyboardType,
      this.controller,
      this.validator,
      this.floatingLabelBehavior,
      this.inputFormatters});
  static FilteringTextInputFormatter get decimalFormatter =>
      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));

  static const double defaultBorderRadius = 4;

  static get _focusedColor => black;
  static get _errorColor => errorColor;
  static get _disabledColor => iconColor;
  static get _enabledColor => iconColor;

  static OutlineInputBorder focusedBorder({double borderRadius = defaultBorderRadius}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(width: 1, color: _focusedColor),
      );

  static OutlineInputBorder disabledBorder({double borderRadius = defaultBorderRadius}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(width: 1, color: _disabledColor),
      );

  static OutlineInputBorder enabledBorder({double borderRadius = defaultBorderRadius}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(width: 1, color: _enabledColor),
      );

  static OutlineInputBorder focusedErrorBorder({double borderRadius = defaultBorderRadius}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(width: 1, color: _errorColor),
      );

  static OutlineInputBorder errorBorder({double borderRadius = defaultBorderRadius}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(width: 1, color: _errorColor),
      );

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? defaultBorderRadius;

    final effectiveFloatingLabelTextStyle = WidgetStateTextStyle.resolveWith((states) {
      final base =
          TextThemeX().text14.copyWith(letterSpacing: 0, fontSize: fontSize, color: iconColor);

      if (states.contains(WidgetState.error)) {
        return base.copyWith(color: _errorColor);
      }
      if (states.contains(WidgetState.focused)) {
        return base.copyWith(color: _focusedColor);
      }
      if (states.contains(WidgetState.disabled)) {
        return base.copyWith(color: _disabledColor);
      }

      return base.copyWith(color: _enabledColor);
    });

    return SizedBox(
      child: TextFormField(
        onTap: onTap,
        key: formFieldKey,
        enabled: enabled,
        cursorHeight: 20,
        autocorrect: false,
        minLines: minLines,
        readOnly: readOnly,
        maxLines: maxLines,
        textAlign: textAlign,
        focusNode: focusNode,
        onChanged: onChanged,
        validator: validator,
        maxLength: maxLength,
        controller: controller,
        obscureText: obscureText,
        initialValue: initialValue,
        onFieldSubmitted: onSubmit,
        keyboardType: keyboardType,
        cursorColor: black,
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        autofillHints: autofillHints,
        style: TextThemeX().text16.copyWith(
              fontSize: fontSize ?? 15,
              color: textColor,
            ),
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          errorMaxLines: 2,
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon != null
              ? UnconstrainedBox(
                  child: SvgPicture.asset(
                    prefixIcon!,
                    width: prefixIconSize,
                    color: iconColor,
                  ),
                )
              : null,
          suffixIcon: suffixIcon,
          suffixText: suffixText,
          helperText: helperText,
          contentPadding: contentPadding,
          suffixStyle: TextThemeX().text18.semiBold,
          floatingLabelBehavior: floatingLabelBehavior,
          hintStyle: TextThemeX().text14.copyWith(
                fontSize: fontSize,
                letterSpacing: 0,
                color: hintTextColor,
              ),
          helperStyle: TextThemeX().text14.copyWith(
                fontSize: 12,
                color: black,
              ),
          labelStyle: TextThemeX().text14.copyWith(
                letterSpacing: 0,
                fontSize: fontSize,
                color: hintTextColor,
              ),
          floatingLabelStyle: effectiveFloatingLabelTextStyle,
          fillColor: fillColor ?? surface,
          border: showBorders
              ? focusedBorder(borderRadius: borderRadius ?? defaultBorderRadius)
              : InputBorder.none,
          errorBorder: showBorders
              ? errorBorder(borderRadius: effectiveBorderRadius) //
              : InputBorder.none,
          enabledBorder: showBorders
              ? enabledBorder(borderRadius: effectiveBorderRadius) //
              : InputBorder.none,
          focusedBorder: showBorders
              ? focusedBorder(borderRadius: effectiveBorderRadius) //
              : InputBorder.none,
          disabledBorder: showBorders
              ? disabledBorder(borderRadius: effectiveBorderRadius) //
              : InputBorder.none,
          focusedErrorBorder: showBorders
              ? focusedErrorBorder(borderRadius: effectiveBorderRadius) //
              : InputBorder.none,
        ),
      ),
    );
  }
}
