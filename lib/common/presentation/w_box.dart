import 'package:flutter/material.dart';

class WBox extends StatelessWidget {
  const WBox(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
