import 'package:library_app/common/data/network/auth_api_service.dart';
import 'package:library_app/di/di_locator.dart';

class GlobalAuthRepository {
  GlobalAuthRepository() : _apiService = sl();
  final AuthApiService _apiService;

  Future<void> logOut() async {
    await _apiService.logOut();
  }
}