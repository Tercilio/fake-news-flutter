import 'dart:convert';

import 'package:basearch/src/exceptions/login_exception.dart';
import 'package:basearch/src/features/auth/data/dto/user_dto.dart';
import 'package:dio/dio.dart';

import '../../domain/model/user.dart';
import '../../domain/repository/login_interface.dart';

class LoginRepository implements ILogin {
  @override
  Future<User> login(User user) async {
    final dto = UserDto.fromDomain(user);
    User? userResponse;

    try {
      final Response response = await Dio().post(
        'https://api-fakenews.herokuapp.com/login',
        data: dto.toJson(),
      );

      Map<String, dynamic> json = jsonDecode(response.data);

      userResponse = User.fromJson(json);
      final token = userResponse.token;

      // final token = response.headers.value('Authorization');

      userResponse = User(user.email, null, token: token);
    } on DioError catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 402) {
        throw LoginException();
      } else {
        throw Exception();
      }
    }

    return userResponse;
  }
}
