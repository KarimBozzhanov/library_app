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
  });

  final void Function()? onTap;
  final Widget child;
  final Color? backgroundColor;
  final double? borderRadius;
  final Alignment? alignment;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? borderColor;

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
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 33),
      padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        border: borderColor != null ? Border.all(color: borderColor ?? Colors.white): null,
        color: backgroundColor ?? Colors.white,
      ),
      child: child,
    );
  }
}
