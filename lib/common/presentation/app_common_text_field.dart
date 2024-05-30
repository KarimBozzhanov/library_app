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
  });

  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final EdgeInsets? margin;
  final String? label;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: textEditingController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: label,
          contentPadding: const EdgeInsets.fromLTRB(29, 18, 10, 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 0.5,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          hintStyle: TextStyle(
            color: AppColors.brightGrey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
