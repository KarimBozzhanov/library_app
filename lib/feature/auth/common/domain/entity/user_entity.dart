import 'package:library_app/common/constant/core_constant.dart';
import 'package:library_app/feature/auth/common/data/user_dto.dart';

class UserEntity {
  UserEntity({
    required this.id,
    required this.userId,
    required this.login,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.group,
  });

  factory UserEntity.fromDto(UserDto dto) => UserEntity(
    id: dto.id ?? CoreConstant.empty,
    userId: dto.userId ?? CoreConstant.empty,
    login: dto.login ?? CoreConstant.empty,
    password: dto.password ?? CoreConstant.empty,
    name: dto.name ?? CoreConstant.empty,
    phoneNumber: dto.phoneNumber ?? CoreConstant.empty,
    group: dto.group ?? CoreConstant.empty,
  );

  final String id;
  final String userId;
  final String login;
  final String password;
  final String name;
  final String phoneNumber;
  final String group;
}
