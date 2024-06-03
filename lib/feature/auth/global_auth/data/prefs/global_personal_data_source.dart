import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:library_app/common/constant/global_pref_constant.dart';
import 'package:library_app/di/di_locator.dart';

class GlobalPersonalDataSource {
  GlobalPersonalDataSource() : _secureStorage = sl();

  final FlutterSecureStorage _secureStorage;

  Future<String?> get userId => _secureStorage.read(key: GlobalPrefConstant.userId);

  Future<String?> get login => _secureStorage.read(key: GlobalPrefConstant.login);

  Future<String?> get password => _secureStorage.read(key: GlobalPrefConstant.password);

  void setUserId(String userId) {
    _secureStorage.write(
      key: GlobalPrefConstant.userId,
      value: userId,
    );
  }

  void setLogin(String login) {
    _secureStorage.write(
      key: GlobalPrefConstant.login,
      value: login,
    );
  }

  void setPassword(String password) {
    _secureStorage.write(
      key: GlobalPrefConstant.password,
      value: password,
    );
  }

  void removeUserId() => _secureStorage.delete(key: GlobalPrefConstant.userId);

  void removeLogin() => _secureStorage.delete(key: GlobalPrefConstant.login);

  void removePassword() => _secureStorage.delete(key: GlobalPrefConstant.password);
}
