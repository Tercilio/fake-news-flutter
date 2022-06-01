class UserOutputDto {
  const UserOutputDto(this.id, this.fullname, this.birthdate, this.address,
      this.email, this.photo, this.token);

  final int id;
  final String fullname;
  final String birthdate;
  final String address;
  final String email;
  final String photo;
  final String token;

  factory UserOutputDto.fromJsonToken(Map<String, dynamic> json, String token) => UserOutputDto(
      json['id'],
      json['fullname'],
      json['birthdate'],
      json['address'],
      json['email'],
      json['photo'],
      token);

  factory UserOutputDto.fromJson(Map<String, dynamic> json) => UserOutputDto(
      json['id'],
      json['fullname'],
      json['birthdate'],
      json['address'],
      json['email'],
      json['photo'],
      json['token']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'birthdate': birthdate.replaceAll('/', '-'),
        'address': address,
        'email': email,
        'photo': photo,
        'token': token
      };
}
