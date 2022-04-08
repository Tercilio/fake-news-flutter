import 'package:mobx/mobx.dart';

part 'signup_viewmodel.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store {
  @observable
  String fullname = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @action
  void validateFullname() {}

  @action
  void validateEmail() {}

  @action
  void validatePassword() {}

  void saveUser() {}
}
