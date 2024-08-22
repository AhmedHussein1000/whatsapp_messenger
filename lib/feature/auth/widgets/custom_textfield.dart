import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_messenger/core/utils/colors.dart';
import 'package:whatsapp_messenger/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.readOnly,
    this.textAlign,
    this.keyboardType,
    this.onTap,
    this.suffixIcon,
    this.onChanged,
    this.autoFocus,
    this.hintStyle,
    this.textStyle,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final bool? autoFocus;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      controller: controller,
      keyboardType: keyboardType,
      autofocus: autoFocus ?? false,
      readOnly: readOnly ?? false,
      textAlign: textAlign ?? TextAlign.start,
      onTap: onTap,
      onChanged: onChanged,
      style: textStyle ?? Styles.styleSemiBold20(context),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kgreenDark),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kgreenDark, width: 2),
        ),
      ),
    );
  }
}
