import 'package:basearch/src/features/auth/domain/model/user.dart';

class UserDto {
  const UserDto(this.email, this.password);

  final String email;
  final String? password;

  factory UserDto.fromDomain(User user) {
    return UserDto(user.email, user.password);
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      UserDto(json['email'], json['password']);

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
