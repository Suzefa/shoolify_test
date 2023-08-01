import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final List<TextInputFormatter>? formats;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final double? elevation;
  final double? borderRadius;
  final String? hintText;
  final Color? borderColor;
  final Widget? suffixIcon;
  final bool isObscure;
  final bool isEnabled;
  final int? maxLines;
  final int? maxLength;
  final int? minLines;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final ValueChanged<String>? onInputText;
  final ValueChanged<String>? onInputSubmit;

  const CustomTextField({
    super.key,
    required this.controller,
    this.formats,
    this.focusNode,
    this.prefixIcon,
    this.elevation,
    this.borderRadius,
    this.hintText,
    this.borderColor,
    this.suffixIcon,
    this.isObscure = false,
    this.isEnabled = true,
    this.maxLines,
    this.maxLength,
    this.minLines,
    this.inputAction,
    this.inputType,
    this.onInputText,
    this.onInputSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: isEnabled,
      obscureText: isObscure,
      onChanged: onInputText,
      onSubmitted: onInputSubmit,
      controller: controller,
      textInputAction: inputAction,
      keyboardType: inputType,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      inputFormatters: formats,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontStyle: FontStyle.italic,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        counterText: "",
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 10.0,
          ),
          borderSide: const BorderSide(
            color: Colors.black54,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 10.0,
          ),
          borderSide: const BorderSide(
            color: Colors.black54,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 10.0,
          ),
          borderSide: const BorderSide(
            color: Colors.black54,
            width: 1.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 10.0,
          ),
          borderSide: const BorderSide(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
