import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/login/domain/use_case/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<CoreState> {
  LoginCubit()
      : _loginUseCase = sl(),
        super(LoginInitialState());

  final LoginUseCase _loginUseCase;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  void initCubit(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    _emailController = emailController;
    _passwordController = passwordController;
  }

  void login() async {
    emit(LoginLoadingState());
    final user = await _loginUseCase.login(_emailController.text, _passwordController.text);
    try {
      if (user != null) {
        emit(
          LoginSuccessState(user),
        );
      } else {
        emit(LoginFailureState());
      }
    } catch(e) {
      emit(LoginFailureState());
    }
  }
}
