import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:library_app/common/constant/core_constant.dart';
import 'package:library_app/common/presentation/localization/presentation/cubit/global_localization_cubit.dart';
import 'package:library_app/config/locale.dart';
import 'package:library_app/feature/auth/global_auth/presentation/cubit/global_auth_cubit.dart';
import 'package:library_app/feature/splash_screen/presentation/ui/splash_screen.dart';
import 'package:library_app/generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GlobalAuthCubit()..checkData(),
        ),
        BlocProvider(
          create: (context) => GlobalLocalizationCubit()..getLocale(),
        ),
      ],
      child:
          BlocBuilder<GlobalLocalizationCubit, GlobalLocalizationCommonState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: state.locale.isNotEmpty
                ? Locale(state.locale, CoreConstant.empty)
                : AppLocale.ru,
            supportedLocales: S.delegate.supportedLocales,
            home: const SafeArea(child: SplashScreen()),
          );
        },
      ),
    );
  }
}
