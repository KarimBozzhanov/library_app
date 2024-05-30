import 'package:flutter/material.dart';
import 'package:library_app/config/theme.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Image.asset(AppImages.logo),
            const SizedBox(
              height: 58,
            ),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Read without limits',
              style: TextStyle(
                
              ),
            )
          ],
        ),
      ),
    );
  }
}

