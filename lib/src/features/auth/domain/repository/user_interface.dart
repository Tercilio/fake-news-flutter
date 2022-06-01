import 'package:basearch/src/features/auth/data/dto/user_input_dto.dart';
import 'package:basearch/src/features/auth/data/dto/user_output_dto.dart';
import 'package:basearch/src/features/main/data/dto/user_input_update_dto.dart';

import '../model/user.dart';

abstract class IUser {
  Future<UserOutputDto> login(User user);
  Future<UserInputDto> singup(UserInputDto userInputDto);
  Future<UserOutputDto> getUser(String email);
  Future<UserOutputDto> updateUser(int idUser, UserInputUpdateDto userDto);
}
