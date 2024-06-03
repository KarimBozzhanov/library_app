import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/global_auth/data/repository/global_auth_repository.dart';
import 'package:library_app/feature/auth/global_auth/data/repository/global_personal_data_repository.dart';

class GlobalLogOutUseCase {
  GlobalLogOutUseCase()
      : _repository = sl(),
        _personalData = sl();

  final GlobalAuthRepository _repository;
  final GlobalPersonalDataRepository _personalData;

  Future<void> execute() async {
    await _repository.logOut();
    _personalData
      ..removeUserId()
      ..removeLogin()
      ..removePassword();
  }
}
