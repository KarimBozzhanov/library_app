import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/feature/auth/global_auth/presentation/cubit/global_auth_cubit.dart';
import 'package:library_app/feature/splash_screen/presentation/ui/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GlobalAuthCubit()..checkData(),
        )
      ],
      child: const SplashScreen(),
    );
  }
}
