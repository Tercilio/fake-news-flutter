import 'dart:convert';

import 'package:basearch/src/features/auth/data/dto/user_dto.dart';
import 'package:basearch/src/features/auth/data/dto/user_input_dto.dart';
import 'package:basearch/src/features/auth/domain/repository/singup_interface.dart';
import 'package:dio/dio.dart';

class SingupRepository implements ISingup {
  @override
  Future<UserInputDto> singup(UserInputDto userInputDto) async {
    final response = await Dio().post(
      'http://localhost:8080/api/user',
      data: userInputDto.toJson(),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = Map.from(response.data);
      
      final responseUser = UserInputDto.fromJson(json);
      
      return Future.value(responseUser);
    } else {
      throw Exception("Usuário ou Senha Inválidos!");
    }
  }
}
