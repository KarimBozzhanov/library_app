import 'package:library_app/common/data/network/auth_api_service.dart';
import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/common/data/user_dto.dart';

class ProfileRepository {
  ProfileRepository() : _apiService = sl();
  final AuthApiService _apiService;

  Future<UserDto> getCurrentUser() async {
    final document = await _apiService.getCurrentUser();
    return UserDto.fromJson(document.data() ?? {}, document.id);
  }
}