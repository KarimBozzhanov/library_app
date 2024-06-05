class UserDto {
  UserDto({
    this.id,
    this.userId,
    this.login,
    this.password,
    this.name,
    this.phoneNumber,
    this.group,
  });

  factory UserDto.fromJson(Map<String, dynamic> json, String userId) => UserDto(
        id: userId,
        userId: json['user_id'] as String?,
        login: json['login'] as String?,
        password: json['password'] as String?,
        name: json['name'] as String?,
        phoneNumber: json['phone_number'] as String?,
        group: json['group'] as String?,
      );

  final String? id;
  final String? userId;
  final String? login;
  final String? password;
  final String? name;
  final String? phoneNumber;
  final String? group;
}
