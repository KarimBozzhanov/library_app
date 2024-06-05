import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_app/common/constant/core_constant.dart';
import 'package:library_app/common/presentation/state/core_state.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/registration/domain/use_case/add_user_use_case.dart';
import 'package:library_app/feature/auth/registration/domain/use_case/registration_use_case.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<CoreState> {
  RegistrationCubit()
      : _registrationUseCase = sl(),
        _addUserUseCase = sl(),
        super(RegistrationInitial());

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _repeatPassController;

  final RegistrationUseCase _registrationUseCase;
  final AddUserUseCase _addUserUseCase;

  void initCubit(
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController nameController,
    TextEditingController repeatPassController,
  ) {
    _emailController = emailController;
    _passwordController = passwordController;
    _nameController = nameController;
    _repeatPassController = repeatPassController;
  }

  Future<void> registration() async {
    emit(RegistrationLoadingState());
    try {
      final user = await _registrationUseCase.registration(
        _emailController.text,
        _passwordController.text,
      );
      if (user != null) {
        final data = {
          'user_id': FirebaseAuth.instance.currentUser?.uid,
          'login': _emailController.text,
          'password': _passwordController.text,
          'name': _nameController.text,
          'phone_number': CoreConstant.empty,
          'group': CoreConstant.empty
        };
        await _addUserUseCase.execute(data);
        emit(RegistrationSuccessState(user));
      } else {
        emit(RegistrationFailureState());
      }
    } catch (e) {
      emit(RegistrationFailureState());
    }
  }
}
