import 'package:basearch/src/features/auth/domain/usecase/signup_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'user_profile_viewmodel.g.dart';

class UserProfileViewModel = _UserProfileViewModelBase
    with _$UserProfileViewModel;

abstract class _UserProfileViewModelBase with Store {
  final error = UserProfileError();
  final _usecase = Modular.get<SignUpUseCase>();

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

  Future<bool> updateUser() async {
    error.clear();

    validateFullname();
    validateBirthdate();

    return true;
  }
}

class UserProfileError = _UserProfileErrorBase with _$UserProfileError;

abstract class _UserProfileErrorBase with Store {
  @observable
  String? fullname = '';

  @observable
  String? birthdate = '';

  @observable
  String? address = '';

  @observable
  String? photo = '';

  @observable
  String updateUser = '';

  @computed
  bool get hasErrors =>
      fullname != null || fullname != null || birthdate != null;

  void clear() {
    fullname = null;
    birthdate = null;
    address = null;
    photo = null;
    updateUser = "";
  }
}
