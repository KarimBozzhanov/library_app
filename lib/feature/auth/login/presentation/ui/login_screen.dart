import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/common/presentation/app_common_text_field.dart';
import 'package:library_app/common/presentation/app_rounded_container.dart';
import 'package:library_app/common/presentation/h_box.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/auth/login/presentation/cubit/login_cubit.dart';
import 'package:library_app/feature/auth/registration/presentation/ui/registration_screen.dart';
import 'package:library_app/feature/main_page/presentation/ui/main_page.dart';
import 'package:library_app/generated/l10n.dart';

class LoginBuilder extends StatelessWidget {
  const LoginBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late LoginCubit _cubit;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _cubit = context.read<LoginCubit>()
      ..initCubit(_emailController, _passwordController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, CoreState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
            ModalRoute.withName('/'),
          );
        }
      },
      builder: (context, state) {
        if (state is LoginInitialState) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HBox(100),
                    Image.asset(
                      AppImages.icColouredLogo,
                      width: 188,
                      height: 174,
                      fit: BoxFit.fitWidth,
                    ),
                    AppCommonTextField(
                      textEditingController: _emailController,
                      label: S.current.email,
                      margin: const EdgeInsets.fromLTRB(30, 55, 30, 24),
                    ),
                    AppCommonTextField(
                      textEditingController: _passwordController,
                      label: S.current.password,
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 55),
                    ),
                    AppRoundedContainer(
                      onTap: () => _cubit.login(),
                      backgroundColor: AppColors.mainBackground,
                      child: Text(
                        S.current.logIn,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.current.doNotHaveAccount,
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const RegistrationBuilder())),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                            ),
                            child: Text(
                              S.current.signUpHere,
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
