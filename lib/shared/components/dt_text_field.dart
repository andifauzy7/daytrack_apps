import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/gen/fonts.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';

enum DTTextFieldType {
  text,
  password,
}

extension DTTextFieldTypeExtension on DTTextFieldType {
  bool get obscureValue {
    switch (this) {
      case DTTextFieldType.text:
        return false;
      case DTTextFieldType.password:
        return true;
      default:
        return false;
    }
  }
}

class DTTextField extends StatelessWidget {
  const DTTextField({
    super.key,
    required this.type,
    this.focusNode,
    this.hintText,
    this.borderRadius,
    this.prefixIcon,
    this.textInputType,
    this.onChanged,
    this.errorText,
  });

  final DTTextFieldType type;
  final FocusNode? focusNode;
  final String? hintText;
  final String? errorText;
  final double? borderRadius;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: CalculateSize.getHeight(10),
      ),
      child: TextField(
        focusNode: focusNode,
        keyboardType: textInputType,
        obscureText: type.obscureValue,
        cursorColor: ColorFamily.tealPrimary,
        onChanged: onChanged,
        style: const TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: ColorFamily.blackPrimary,
        ),
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          prefixIcon: prefixIcon,
          errorText: errorText,
          errorMaxLines: 2,
          suffixIcon: type == DTTextFieldType.password
              ? const Icon(Icons.remove_red_eye_outlined)
              : null,
          hintStyle: const TextStyle(
            fontFamily: FontFamily.inter,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: ColorFamily.greyPrimary,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1, color: ColorFamily.greyPrimary),
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1, color: ColorFamily.tealPrimary),
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
          ),
        ),
      ),
    );
  }
}
