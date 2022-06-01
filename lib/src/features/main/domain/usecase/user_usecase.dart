import 'package:basearch/src/features/auth/data/dto/user_output_dto.dart';
import 'package:basearch/src/features/auth/domain/repository/user_interface.dart';
import 'package:basearch/src/features/main/data/dto/user_input_update_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../repository/news_interface.dart';

class UserUseCase {
  final repository = Modular.get<IUser>();

  String? validateFullname(String fullname) {
    if (fullname.isEmpty) {
      return 'fullname_required'.i18n();
    }

    return null;
  }

  String? validateBirthdate(String birthdate) {
    if (birthdate.isEmpty) {
      return 'birthdate_required'.i18n();
    }
    return null;
  }

  String formatDateTime(String date) {
    if (date.isEmpty) {
      return '';
    } else if (date.split("/")[0].length == 4) {
      return date;
    }

    List<String> arrayStringDate = date.split("/");
    String days = arrayStringDate[0];

    arrayStringDate[0] = arrayStringDate[2];
    arrayStringDate[2] = days;

    date = arrayStringDate[0] +
        "-" +
        arrayStringDate[1] +
        "-" +
        arrayStringDate[2];

    return date;
  }

  Future<UserOutputDto> updateUser(int idUser, UserInputUpdateDto dto) {
    return repository.updateUser(idUser, dto);
  }
}
