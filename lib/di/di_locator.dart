import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:library_app/common/data/network/auth_api_service.dart';
import 'package:library_app/common/data/network/cloud_firestore_api_service.dart';
import 'package:library_app/common/presentation/localization/data/prefs/global_localization_data_source.dart';
import 'package:library_app/common/presentation/localization/data/repository/global_localization_repository.dart';
import 'package:library_app/common/presentation/localization/domain/use_case/global_localization_use_case.dart';
import 'package:library_app/feature/auth/global_auth/data/prefs/global_personal_data_source.dart';
import 'package:library_app/feature/auth/global_auth/data/repository/global_auth_repository.dart';
import 'package:library_app/feature/auth/global_auth/data/repository/global_personal_data_repository.dart';
import 'package:library_app/feature/auth/global_auth/domain/use_case/global_log_out_use_case.dart';
import 'package:library_app/feature/auth/global_auth/domain/use_case/global_sign_in_use_case.dart';
import 'package:library_app/feature/auth/login/data/repository/login_repository.dart';
import 'package:library_app/feature/auth/login/domain/use_case/login_use_case.dart';
import 'package:library_app/feature/auth/registration/data/repository/registration_repository.dart';
import 'package:library_app/feature/auth/registration/domain/use_case/add_user_use_case.dart';
import 'package:library_app/feature/auth/registration/domain/use_case/registration_use_case.dart';
import 'package:library_app/feature/create_post/domain/use_case/add_post_use_case.dart';
import 'package:library_app/feature/post_details/data/repository/post_details_repository.dart';
import 'package:library_app/feature/post_details/domain/use_case/add_comment_use_case.dart';
import 'package:library_app/feature/post_details/domain/use_case/get_comments_use_case.dart';
import 'package:library_app/feature/home/data/repository/posts_repository.dart';
import 'package:library_app/feature/home/domain/use_case/get_posts_use_case.dart';
import 'package:library_app/feature/profile/data/repository/profile_repository.dart';
import 'package:library_app/feature/profile/domain/use_case/profile_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  _commonModule();
  await _dataSourceModule();
  _apiServiceModule();
  _repositoryModule();
  _useCaseModule();
}

void _commonModule() {
  final sharedPreferences = SharedPreferences.getInstance();
  sl
    ..registerSingletonAsync(() => sharedPreferences)
    ..registerSingleton(const FlutterSecureStorage());
}

Future<void> _dataSourceModule() async {
  sl
    ..registerSingleton(GlobalPersonalDataSource())
    ..registerFactory(() => GlobalLocalizationDataSource(sl.getAsync()));
}

void _apiServiceModule() {
  sl
    ..registerSingleton(AuthApiService())
    ..registerSingleton(CloudFirestoreApiService());
}

void _repositoryModule() {
  sl
    ..registerFactory(GlobalPersonalDataRepository.new)
    ..registerFactory(LoginRepository.new)
    ..registerFactory(RegistrationRepository.new)
    ..registerFactory(GlobalLocalizationRepository.new)
    ..registerFactory(GlobalAuthRepository.new)
    ..registerFactory(PostsRepository.new)
    ..registerFactory(PostDetailsRepository.new)
    ..registerFactory(ProfileRepository.new);
}

void _useCaseModule() {
  sl
    ..registerFactory(GlobalSignInUseCase.new)
    ..registerFactory(LoginUseCase.new)
    ..registerFactory(RegistrationUseCase.new)
    ..registerFactory(GlobalGetLocalizationUseCase.new)
    ..registerFactory(GlobalSetLocalizationUseCase.new)
    ..registerFactory(GlobalRemoveLocalizationUseCase.new)
    ..registerFactory(GlobalLogOutUseCase.new)
    ..registerFactory(GetPostsUseCase.new)
    ..registerFactory(GetCommentsUseCase.new)
    ..registerFactory(ProfileUseCase.new)
    ..registerFactory(AddUserUseCase.new)
    ..registerFactory(AddCommentUseCase.new)
    ..registerFactory(AddPostUseCase.new);
}
