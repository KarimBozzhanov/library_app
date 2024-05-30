import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/auth/global_auth/presentation/cubit/global_auth_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalAuthCubit, GlobalAuthState>(
      listener: (context, state) {
        if (state is GlobalAuthSuccessState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ));
        } else if (state is GlobalLogOutState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Image.asset(
                AppImages.logo,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        );
      },
    );
  }
}
