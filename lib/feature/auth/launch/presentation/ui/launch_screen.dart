import 'package:flutter/material.dart';
import 'package:library_app/common/presentation/app_rounded_container.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/auth/login/presentation/ui/login_screen.dart';
import 'package:library_app/feature/auth/registration/presentation/ui/registration_screen.dart';
import 'package:library_app/generated/l10n.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 150, 70, 58),
              child: Image.asset(
                AppImages.logo,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              S.current.welcome,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 42,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              S.current.readWithoutLimits,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            AppRoundedContainer(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistrationBuilder(),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
              margin: const EdgeInsets.fromLTRB(16, 54, 16, 20),
              backgroundColor: Colors.white,
              child: Text(
                S.current.createAccount,
                style: const TextStyle(
                  color: AppColors.mainBackground,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            AppRoundedContainer(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginBuilder(),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              backgroundColor: Colors.transparent,
              borderColor: Colors.white,
              child: Text(
                S.current.logIn,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
