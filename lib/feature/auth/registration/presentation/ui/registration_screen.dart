import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/common/presentation/app_common_text_field.dart';
import 'package:library_app/common/presentation/app_rounded_container.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/auth/global_auth/presentation/cubit/global_auth_cubit.dart';
import 'package:library_app/feature/auth/login/presentation/ui/login_screen.dart';
import 'package:library_app/feature/auth/registration/presentation/cubit/registration_cubit.dart';
import 'package:library_app/generated/l10n.dart';

class RegistrationBuilder extends StatelessWidget {
  const RegistrationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(),
      child: const RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _repeatPassController;
  late RegistrationCubit _cubit;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _repeatPassController = TextEditingController();
    _cubit = context.read<RegistrationCubit>()
      ..initCubit(_emailController, _passwordController, _nameController,
          _repeatPassController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, CoreState>(
      listener: (context, state) {
        if (state is RegistrationSuccessState) {
          Navigator.pop(context);
          context.read<GlobalAuthCubit>().authSuccess(state.user);
        }
      },
      builder: (context, state) {
        if (state is RegistrationInitial) {
          return Scaffold(
            backgroundColor: AppColors.mainBackground,
            appBar: AppBar(
              forceMaterialTransparency: true,
              centerTitle: true,
              title: Text(
                S.of(context).signUpHere,
                style: const TextStyle(
                  color: AppColors.rdBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 72, bottom: 32),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).fillYourDetailsToLogin,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  AppCommonTextField(
                    textEditingController: _nameController,
                    label: S.of(context).username,
                    margin: const EdgeInsets.only(bottom: 24),
                  ),
                  AppCommonTextField(
                    textEditingController: _emailController,
                    label: S.of(context).email,
                    margin: const EdgeInsets.only(bottom: 24),
                  ),
                  AppCommonTextField(
                    textEditingController: _passwordController,
                    label: S.of(context).password,
                    isPassword: true,
                    margin: const EdgeInsets.only(bottom: 24),
                  ),
                  AppCommonTextField(
                    textEditingController: _repeatPassController,
                    isPassword: true,
                    label: S.of(context).repPassword,
                    margin: const EdgeInsets.only(bottom: 32),
                  ),
                  AppRoundedContainer(
                    onTap: () => _cubit.registration(),
                    backgroundColor: AppColors.rdBlack,
                    child: Text(
                      S.of(context).signUpHere,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const LoginBuilder(),
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(
                              left: 5,
                            ),
                          ),
                          child: const Text(
                            'Log in here',
                            style: TextStyle(
                              color: Colors.black,
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
