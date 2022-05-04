import 'package:basearch/src/features/auth/domain/model/user.dart';

class UserInputDto {
  const UserInputDto(this.fullname, this.birthdate, this.email, this.password);

  final String fullname;
  final String birthdate;
  final String email;
  final String? password;

  // factory UserDto.fromDomain(User user) {
  //   return UserDto(user.email, user.password);
  // }

  factory UserInputDto.fromJson(Map<String, dynamic> json) => UserInputDto(
      json['fullname'], json['birthdate'], json['email'], json['password']);

  Map<String, dynamic> toJson() => {
        'fullname': fullname,
        'birthdate': birthdate,
        'email': email,
        'password': password
      };
}
