import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_app/common/data/network/auth_api_service.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/login/domain/use_case/login_use_case.dart';

class LoginRepository {
  LoginRepository() : _apiService = sl();

  final AuthApiService _apiService;

  Future<User?> login(GlobalAuthParam param) async {
    final credential = await _apiService.login(param);
    return credential.user;
  }
}
