import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:library_app/feature/auth/global_auth/data/prefs/global_personal_data_source.dart';
import 'package:library_app/feature/auth/global_auth/data/repository/global_personal_data_repository.dart';
import 'package:library_app/feature/auth/global_auth/domain/use_case/global_sign_in_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  _commonModule();
  await _dataSourceModule();
  _repositoryModule();
  _useCaseModule();
}

void _commonModule() {
  final sharedPreferences = SharedPreferences.getInstance();
  sl
    ..registerSingleton(() => sharedPreferences)
    ..registerSingleton(const FlutterSecureStorage());
}

Future<void> _dataSourceModule() async {
  sl.registerSingleton(GlobalPersonalDataSource());
}

void _repositoryModule() {
  sl..registerFactory(GlobalPersonalDataRepository.new);
}

void _useCaseModule() {
  sl..registerFactory(GlobalSignInUseCase.new);
}