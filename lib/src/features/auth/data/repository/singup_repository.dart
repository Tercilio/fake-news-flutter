import 'dart:convert';

import 'package:basearch/src/exceptions/singup_exception.dart';
import 'package:basearch/src/features/auth/data/dto/user_dto.dart';
import 'package:basearch/src/features/auth/data/dto/user_input_dto.dart';
import 'package:basearch/src/features/auth/domain/repository/singup_interface.dart';
import 'package:dio/dio.dart';

class SingupRepository implements ISingup {
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
}
