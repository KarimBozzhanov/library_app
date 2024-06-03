import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/auth/global_auth/presentation/cubit/global_auth_cubit.dart';
import 'package:library_app/feature/auth/launch/presentation/ui/launch_screen.dart';
import 'package:library_app/feature/main_page/presentation/ui/main_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalAuthCubit, CoreState>(
      buildWhen: (context, state) => state is GlobalAuthInitialState || state is GlobalAuthSuccessState || state is GlobalLogOutState,
      builder: (context, state) {
        if (state is GlobalAuthSuccessState) {
          return const MainPage();
        } else if (state is GlobalLogOutState) {
          return const LaunchScreen();
        }
        return Scaffold(
          backgroundColor: AppColors.mainBackground,
          body: Center(
            child: Image.asset(
              AppImages.logo,
              width: 200,
              height: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
        );
      },
    );
  }
}
