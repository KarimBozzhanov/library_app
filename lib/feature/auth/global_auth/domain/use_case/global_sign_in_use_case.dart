import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/global_auth/data/repository/global_personal_data_repository.dart';

class GlobalSignInUseCase {
  GlobalSignInUseCase() : _dataSource = sl();

  final GlobalPersonalDataRepository _dataSource;

  Future<GlobalUserDataEntity> execute() async {
    final userId = await _dataSource.userId;
    final email = await _dataSource.login;
    final password = await _dataSource.password;
    return GlobalUserDataEntity(
      userId: userId,
      email: email,
      password: password,
    );
  }
}

class GlobalUserDataEntity {
  GlobalUserDataEntity({
    this.userId,
    this.email,
    this.password,
  });

  final String? userId;
  final String? email;
  final String? password;
}
