import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/common/domain/entity/user_entity.dart';
import 'package:library_app/feature/profile/data/repository/profile_repository.dart';

class ProfileUseCase {
  ProfileUseCase() : _repository = sl();

  final ProfileRepository _repository;

  Future<UserEntity> execute() async {
    final user = await _repository.getCurrentUser();
    return UserEntity.fromDto(user);
  }
}