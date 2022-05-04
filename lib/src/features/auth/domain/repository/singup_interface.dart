import 'package:basearch/src/features/auth/data/dto/user_input_dto.dart';

abstract class ISingup {
  Future<UserInputDto> singup(UserInputDto userInputDto);
}
