import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

enum DTElevatedButtonType {
  primary,
  secondary,
  disabled,
}

extension DTElevatedButtonExtension on DTElevatedButtonType {
  TextStyle get textStyle {
    const primaryStyle = TextStyle(
      fontSize: 15,
      fontFamily: FontFamily.inter,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );

    const secondaryStyle = TextStyle(
      fontSize: 15,
      fontFamily: FontFamily.inter,
      color: ColorFamily.tealPrimary,
      fontWeight: FontWeight.w500,
    );

    const disabledStyle = TextStyle(
      fontSize: 15,
      fontFamily: FontFamily.inter,
      color: ColorFamily.blackPrimary,
      fontWeight: FontWeight.w500,
    );

    switch (this) {
      case DTElevatedButtonType.primary:
        return primaryStyle;
      case DTElevatedButtonType.secondary:
        return secondaryStyle;
      case DTElevatedButtonType.disabled:
        return disabledStyle;
      default:
        return primaryStyle;
    }
  }

  ButtonStyle get background {
    final primaryBackground = ElevatedButton.styleFrom(
      backgroundColor: ColorFamily.tealPrimary,
      shadowColor: Colors.white,
    );

    final secondaryBackground = ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      side: const BorderSide(
        width: 1.0,
        color: ColorFamily.tealPrimary,
      ),
    );

    final disabledBackground = ElevatedButton.styleFrom(
      backgroundColor: ColorFamily.greyPrimary,
      shadowColor: Colors.white,
    );

    switch (this) {
      case DTElevatedButtonType.primary:
        return primaryBackground;
      case DTElevatedButtonType.secondary:
        return secondaryBackground;
      case DTElevatedButtonType.disabled:
        return disabledBackground;
      default:
        return primaryBackground;
    }
  }
}

class DTElevatedButton extends StatelessWidget {
  const DTElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.type,
    this.fontSize,
    this.dynamicWidth,
  });

  final bool? dynamicWidth;
  final VoidCallback onPressed;
  final String text;
  final DTElevatedButtonType type;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (type != DTElevatedButtonType.disabled) {
          onPressed();
        }
      },
      style: type.background,
      child: SizedBox(
        width: dynamicWidth == true ? null : double.infinity,
        child: Center(
          child: Text(
            text,
            style: type.textStyle.copyWith(fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
