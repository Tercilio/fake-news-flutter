import 'dart:convert';

import 'package:basearch/src/exceptions/login_exception.dart';
import 'package:basearch/src/exceptions/singup_exception.dart';
import 'package:basearch/src/features/auth/data/dto/user_dto.dart';
import 'package:basearch/src/features/auth/data/dto/user_input_dto.dart';
import 'package:basearch/src/features/auth/data/dto/user_output_dto.dart';
import 'package:dio/dio.dart';

import '../../domain/model/user.dart';
import '../../domain/repository/user_interface.dart';

class UserRepository implements IUser {
  @override
  Future<UserOutputDto> login(User user) async {
    final dto = UserDto.fromDomain(user);
    UserOutputDto? userResponse;

    try {
      final Response response = await Dio().post(
        'https://api-fakenews.herokuapp.com/login',
        data: dto.toJson(),
      );

      Map<String, dynamic> json = jsonDecode(response.data);
      userResponse = UserOutputDto.fromJson(json);
    } on DioError catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 402) {
        throw LoginException();
      } else {
        throw Exception();
      }
    }

    return userResponse;
  }

  @override
  Future<UserInputDto> singup(UserInputDto userInputDto) async {
    UserInputDto? userResponse;

    try {
      final response = await Dio().post(
        'https://api-fakenews.herokuapp.com/api/user',
        data: userInputDto.toJson(),
      );

      final Map<String, dynamic> json = Map.from(response.data);

      userResponse = UserInputDto.fromJson(json);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        throw SingUpException("Invalid email address.");
      } else {
        throw Exception("Server error.");
      }
    }

    return userResponse;
  }

  @override
  Future<UserOutputDto> getUser(String email) async {
    UserOutputDto? userResponse;

    try {
      final response = await Dio().get(
        'https://api-fakenews.herokuapp.com/api/user?email=' + email,
      );

      final Map<String, dynamic> json = Map.from(response.data);

      userResponse = UserOutputDto.fromJson(json);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception("Invalid email address.");
      } else {
        throw Exception("Server error.");
      }
    }

    return userResponse;
  }
}
