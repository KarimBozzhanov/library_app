import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/common/presentation/app_common_text_field.dart';
import 'package:library_app/common/presentation/app_rounded_container.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/auth/global_auth/presentation/cubit/global_auth_cubit.dart';
import 'package:library_app/feature/auth/login/presentation/cubit/login_cubit.dart';
import 'package:library_app/feature/auth/registration/presentation/ui/registration_screen.dart';
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
          Navigator.pop(context);
          context.read<GlobalAuthCubit>().authSuccess(state.user);
        }
      },
      builder: (context, state) {
        if (state is LoginInitialState) {
          return Scaffold(
            backgroundColor: AppColors.mainBackground,
            appBar: AppBar(
              centerTitle: true,
              forceMaterialTransparency: true,
              title: Text(
                S.current.logIn,
                style: const TextStyle(
                  color: AppColors.rdBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: AutofillGroup(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100, bottom: 32),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          S.current.fillYourDetailsToLogin,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    AppCommonTextField(
                      textEditingController: _emailController,
                      label: S.current.email,
                      margin: const EdgeInsets.only(bottom: 24),
                    ),
                    AppCommonTextField(
                      textEditingController: _passwordController,
                      label: S.current.password,
                      isPassword: true,
                      margin: const EdgeInsets.only(bottom: 32),
                    ),
                    AppRoundedContainer(
                      onTap: () => _cubit.login(),
                      backgroundColor: AppColors.rdBlack,
                      child: Text(
                        S.current.logIn,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.current.doNotHaveAccount,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const RegistrationBuilder())),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                            ),
                            child: Text(
                              S.current.register,
                              style: const TextStyle(
                                color: AppColors.black,
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
