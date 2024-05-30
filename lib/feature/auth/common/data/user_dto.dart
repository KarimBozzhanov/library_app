class UserDto {
  UserDto({
    this.id,
    this.login,
    this.password,
    this.name,
    this.phoneNumber,
    this.city,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json['id'] as String?,
        login: json['login'] as String?,
        password: json['password'] as String?,
        name: json['name'] as String?,
        phoneNumber: json['phone_number'] as String?,
        city: json['city'] as String?,
      );

  final String? id;
  final String? login;
  final String? password;
  final String? name;
  final String? phoneNumber;
  final String? city;
}
