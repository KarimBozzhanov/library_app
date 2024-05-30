import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/login/data/repository/login_repository.dart';

class LoginUseCase {
  LoginUseCase() : _repository = sl();

  final LoginRepository _repository;

  Future<User?> login(String email, String password) {
    final param = GlobalAuthParam(email: email, password: password);
    final user = _repository.login(param);
    return user;
  }

  Future<User?> registration(String email, String password) {
    final param = GlobalAuthParam(email: email, password: password);
    final user = _repository.registration(param);
    return user;
  }
}


class GlobalAuthParam {
  GlobalAuthParam({required this.email, required this.password,});

  final String email;
  final String password;
}