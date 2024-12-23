import 'package:flutter/material.dart';

class AppRoundedContainer extends StatelessWidget {
  const AppRoundedContainer({
    super.key,
    this.onTap,
    required this.child,
    this.backgroundColor,
    this.borderRadius,
    this.alignment,
    this.margin,
    this.padding,
    this.borderColor,
    this.height,
  });

  final void Function()? onTap;
  final Widget child;
  final Color? backgroundColor;
  final double? borderRadius;
  final Alignment? alignment;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? borderColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: _getContainer(),
      );
    }
    return _getContainer();
  }

  Widget _getContainer() {
    return Container(
      alignment: alignment ?? Alignment.center,
      margin: margin,
      height: height ?? 60,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        border: borderColor != null ? Border.all(color: borderColor ?? Colors.white): null,
        color: backgroundColor ?? Colors.white,
      ),
      child: child,
    );
  }
}
