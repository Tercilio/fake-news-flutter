import 'package:basearch/src/features/auth/data/dto/user_output_dto.dart';
import 'package:basearch/src/features/auth/domain/model/user_secure_storage.dart';
import 'package:basearch/src/features/main/data/dto/user_input_update_dto.dart';
import 'package:basearch/src/features/main/domain/usecase/user_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:mobx/mobx.dart';

part 'user_profile_viewmodel.g.dart';

class UserProfileViewModel = _UserProfileViewModelBase
    with _$UserProfileViewModel;

abstract class _UserProfileViewModelBase with Store {
  final error = UserProfileError();
  final _usecase = Modular.get<UserUseCase>();

  @observable
  String email = '';

  @observable
  String fullname = '';

  @observable
  String birthdate = '';

  @observable
  String address = '';

  @observable
  String photo = '';

  @observable
  String age = '';

  @observable
  bool isLoading = false;

  @observable
  bool isDateSelected = false;

  @observable
  bool isAccountUpdated = false;

  @action
  void validateFullname() {
    error.fullname = _usecase.validateFullname(fullname);
  }

  @action
  void validateBirthdate() {
    error.birthdate = _usecase.validateBirthdate(birthdate);
  }

  Future<bool> updateUser(int idUser) async {
    error.clear();

    validateFullname();
    validateBirthdate();

    if (!error.hasErrors) {
      isLoading = true;

      try {
        String dateTime = _usecase.formatDateTime(birthdate);

        UserInputUpdateDto dto =
            UserInputUpdateDto(email, fullname, dateTime, address, photo);

        UserOutputDto userOutputDto = await _usecase.updateUser(idUser, dto);
        UserSecureStorage.setUser(userOutputDto);

        return true;
      } on Exception {
        error.updateUser = 'singup_invalid'.i18n();
      } finally {
        isLoading = false;
      }
    }

    return false;
  }
}

class UserProfileError = _UserProfileErrorBase with _$UserProfileError;

abstract class _UserProfileErrorBase with Store {
  @observable
  String? fullname;

  @observable
  String? birthdate;

  @observable
  String updateUser = '';

  @computed
  bool get hasErrors => fullname != null || birthdate != null;

  void clear() {
    fullname = null;
    birthdate = null;
    updateUser = '';
  }
}
