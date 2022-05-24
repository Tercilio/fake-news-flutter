class UserOutputDto {
  const UserOutputDto(this.id, this.fullname, this.birthdate, this.email,
      this.photo, this.token);

  final int id;
  final String fullname;
  final String birthdate;
  final String email;
  final String photo;
  final String token;

  factory UserOutputDto.fromJson(Map<String, dynamic> json) => UserOutputDto(
      json['id'],
      json['fullname'],
      json['birthdate'],
      json['email'],
      json['photo'],
      json['token']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'birthdate': birthdate.replaceAll('/', '-'),
        'email': email,
        'photo': photo,
        'token': token
      };
}
