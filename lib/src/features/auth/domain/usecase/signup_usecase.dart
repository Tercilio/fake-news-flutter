import 'package:basearch/src/features/auth/data/dto/user_input_dto.dart';
import 'package:basearch/src/features/auth/domain/repository/user_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class SignUpUseCase {
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

  String? validateEmail(String email) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);

    if (email.isEmpty) {
      return 'email_required'.i18n();
    } else if (!regExp.hasMatch(email)) {
      return 'email_invalid'.i18n();
    }

    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'password_required'.i18n();
    }

    return null;
  }

  Future<UserInputDto> singup(
      String fullname, String birthdate, String email, String password) {
    return repository
        .singup(UserInputDto(fullname, birthdate, email, password));
  }
}
