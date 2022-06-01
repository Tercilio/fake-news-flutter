import 'package:basearch/src/features/auth/data/dto/user_output_dto.dart';

class UserInputUpdateDto {
  const UserInputUpdateDto(
      this.email, this.fullname, this.birthdate, this.address, this.photo);

  final String email;
  final String fullname;
  final String birthdate;
  final String address;
  final String photo;

  factory UserInputUpdateDto.fromDomain(UserOutputDto _user) {
    return UserInputUpdateDto(_user.email, _user.fullname, _user.birthdate,
        _user.address, _user.photo);
  }

  factory UserInputUpdateDto.fromJson(Map<String, dynamic> json) =>
      UserInputUpdateDto(json['email'], json['fullname'], json['birthdate'],
          json['address'], json['photo']);

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': '',
        'fullname': fullname,
        'address': address,
        'photo': photo,
        'birthdate': birthdate.replaceAll('/', '-')
      };
}
