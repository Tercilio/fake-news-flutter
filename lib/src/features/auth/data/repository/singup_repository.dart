import 'dart:convert';

import 'package:basearch/src/features/auth/data/dto/user_dto.dart';
import 'package:basearch/src/features/auth/data/dto/user_input_dto.dart';
import 'package:basearch/src/features/auth/domain/repository/singup_interface.dart';
import 'package:dio/dio.dart';

class SingupRepository implements ISingup {
  @override
  Future<UserInputDto> singup(UserInputDto userInputDto) async {
    final response = await Dio().post(
      'http://localhost:8080/login',
      data: userInputDto.toJson(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.data);

      final respUser = UserInputDto.fromJson(json);
      final domain = UserInputDto(
          respUser.fullname, respUser.birthdate, respUser.email, null);

      return Future.value(domain);
    } else {
      throw Exception("Usuário ou Senha Inválidos!");
    }
  }
}
