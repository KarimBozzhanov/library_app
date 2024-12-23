import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_app/common/presentation/app_rounded_container.dart';
import 'package:library_app/common/presentation/h_box.dart';
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
      body: Stack(
        children: [
          Image.asset(
            AppImages.icLaunchBackground,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    AppImages.logo,
                    width: 137,
                    height: 137,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  S.of(context).launchDescription,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                ),
                AppRoundedContainer(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const LoginBuilder(),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.fromLTRB(16, 70, 16, 14),
                  backgroundColor: AppColors.rdBlack,
                  child: Text(
                    S.of(context).logIn,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                AppRoundedContainer(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const RegistrationBuilder(),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  backgroundColor: Colors.transparent,
                  child: Text(
                    S.of(context).signUpHere,
                    style: const TextStyle(
                      color: AppColors.rdBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const HBox(40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
