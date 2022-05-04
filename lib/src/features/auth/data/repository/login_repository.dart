import 'dart:convert';

import 'package:basearch/src/features/auth/data/dto/user_dto.dart';
import 'package:dio/dio.dart';

import '../../domain/model/user.dart';
import '../../domain/repository/login_interface.dart';

class LoginRepository implements ILogin {
  @override
  Future<User> login(User user) async {
    final dto = UserDto.fromDomain(user);

    final response = await Dio().post(
      'http://localhost:8080/login',
      data: dto.toJson(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.data);

      final userResponse = User.fromJson(json);
      final token = userResponse.token;

      // final email = userResponse.email;
      // final token = response.headers.value('Authorization');

      final domain = User(user.email, null, token: token);

      return Future.value(domain);
    } else {
      throw Exception("Usuário ou Senha Inválidos!");
    }
  }
}
