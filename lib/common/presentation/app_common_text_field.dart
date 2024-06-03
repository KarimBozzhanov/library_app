import 'package:flutter/material.dart';
import 'package:library_app/config/theme.dart';

class AppCommonTextField extends StatelessWidget {
  const AppCommonTextField({
    super.key,
    required this.textEditingController,
    this.onChanged,
    this.onSubmitted,
    this.margin,
    this.label,
    this.keyboardType,
    this.isPassword = false,
  });

  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final EdgeInsets? margin;
  final String? label;
  final TextInputType? keyboardType;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: label,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.rdBlack,
              width: 2,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none
          ),
          fillColor: AppColors.lightGrey,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          hintStyle: const TextStyle(
            color: AppColors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
