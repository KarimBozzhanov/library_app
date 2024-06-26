import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_app/common/constant/core_constant.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/global_auth/data/repository/global_personal_data_repository.dart';
import 'package:library_app/feature/auth/login/data/repository/login_repository.dart';

class LoginUseCase {
  LoginUseCase()
      : _repository = sl(),
        _globalPersonalData = sl();

  final LoginRepository _repository;
  final GlobalPersonalDataRepository _globalPersonalData;

  Future<User?> login(String email, String password) async {
    final param = GlobalAuthParam(email: email, password: password);
    final user = await _repository.login(param);
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

class GlobalAuthParam {
  GlobalAuthParam({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
