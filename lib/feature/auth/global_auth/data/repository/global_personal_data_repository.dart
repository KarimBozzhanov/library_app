import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/global_auth/data/prefs/global_personal_data_source.dart';

class GlobalPersonalDataRepository {
  GlobalPersonalDataRepository() : _dataSource = sl();

  final GlobalPersonalDataSource _dataSource;

  Future<String?> get userId => _dataSource.userId;

  Future<String?> get login => _dataSource.login;

  Future<String?> get password => _dataSource.password;

  void setUserId(String userId) => _dataSource.setUserId(userId);

  void setLogin(String login) => _dataSource.setLogin(login);

  void setPassword(String password) => _dataSource.setPassword(password);

  void removeUserId() => _dataSource.removeUserId();

  void removeLogin() => _dataSource.removeLogin();

  void removePassword() => _dataSource.removePassword();
}