import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/common/presentation/app_common_text_field.dart';
import 'package:library_app/common/presentation/app_rounded_container.dart';
import 'package:library_app/common/presentation/h_box.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/config/theme.dart';
import 'package:library_app/feature/auth/login/presentation/ui/login_screen.dart';
import 'package:library_app/feature/auth/registration/presentation/cubit/registration_cubit.dart';
import 'package:library_app/feature/main_page/presentation/ui/main_page.dart';

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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
            ModalRoute.withName('/'),
          );
        }
      },
      builder: (context, state) {
        if (state is RegistrationInitial) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HBox(54),
                    Image.asset(
                      AppImages.icColouredLogo,
                      width: 188,
                      height: 174,
                      fit: BoxFit.fitWidth,
                    ),
                    AppCommonTextField(
                      textEditingController: _nameController,
                      label: 'Full name',
                      margin: const EdgeInsets.fromLTRB(30, 55, 30, 25),
                    ),
                    AppCommonTextField(
                      textEditingController: _emailController,
                      label: 'Email',
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    ),
                    AppCommonTextField(
                      textEditingController: _passwordController,
                      label: 'Password',
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    ),
                    AppCommonTextField(
                      textEditingController: _repeatPassController,
                      label: 'Repeat password',
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 41),
                    ),
                    AppRoundedContainer(
                      onTap: () => _cubit.registration(),
                      backgroundColor: AppColors.mainBackground,
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
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
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
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
