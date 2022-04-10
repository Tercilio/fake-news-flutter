import 'package:localization/localization.dart';

class ForgotPasswordUseCase {

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

 String? validateNewPassword(String password, String newPassword) {
    if (password != newPassword) {
      return 'diferent_password'.i18n();
    }

    return null;
  }

    String? validateCode(String code) {
    if (code.isEmpty) {
      return 'password_required'.i18n();
    }

    return null;
  }
}
