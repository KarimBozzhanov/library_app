import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_app/common/constant/core_constant.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/global_auth/data/repository/global_personal_data_repository.dart';
import 'package:library_app/feature/auth/login/domain/use_case/login_use_case.dart';
import 'package:library_app/feature/auth/registration/data/repository/registration_repository.dart';

class RegistrationUseCase {
  RegistrationUseCase()
      : _repository = sl(),
        _globalPersonalData = sl();

  final RegistrationRepository _repository;
  final GlobalPersonalDataRepository _globalPersonalData;

  Future<User?> registration(String email, String password) async {
    final param = GlobalAuthParam(email: email, password: password);
    final user = await _repository.registration(param);
    safeUserToStorage(param, user);
    return user;
  }

  void safeUserToStorage(GlobalAuthParam param, User? user) {
    _globalPersonalData
      ..setLogin(param.email)
      ..setPassword(param.password)
      ..setUserId(user?.uid ?? CoreConstant.empty);
  }
}
