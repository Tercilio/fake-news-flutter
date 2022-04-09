// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpViewModel on _SignUpViewModelBase, Store {
  final _$fullnameAtom = Atom(name: '_SignUpViewModelBase.fullname');

  @override
  String get fullname {
    _$fullnameAtom.reportRead();
    return super.fullname;
  }

  @override
  set fullname(String value) {
    _$fullnameAtom.reportWrite(value, super.fullname, () {
      super.fullname = value;
    });
  }

  final _$birthdateAtom = Atom(name: '_SignUpViewModelBase.birthdate');

  @override
  String get birthdate {
    _$birthdateAtom.reportRead();
    return super.birthdate;
  }

  @override
  set birthdate(String value) {
    _$birthdateAtom.reportWrite(value, super.birthdate, () {
      super.birthdate = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignUpViewModelBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUpViewModelBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_SignUpViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isDateSelectedAtom =
      Atom(name: '_SignUpViewModelBase.isDateSelected');

  @override
  bool get isDateSelected {
    _$isDateSelectedAtom.reportRead();
    return super.isDateSelected;
  }

  @override
  set isDateSelected(bool value) {
    _$isDateSelectedAtom.reportWrite(value, super.isDateSelected, () {
      super.isDateSelected = value;
    });
  }

  final _$_SignUpViewModelBaseActionController =
      ActionController(name: '_SignUpViewModelBase');

  @override
  void validateFullname() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.validateFullname');
    try {
      return super.validateFullname();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateBirthdate() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.validateBirthdate');
    try {
      return super.validateBirthdate();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fullname: ${fullname},
birthdate: ${birthdate},
email: ${email},
password: ${password},
isLoading: ${isLoading},
isDateSelected: ${isDateSelected}
    ''';
  }
}

mixin _$LoginError on _LoginErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_LoginErrorBase.hasErrors'))
          .value;

  final _$fullnameAtom = Atom(name: '_LoginErrorBase.fullname');

  @override
  String? get fullname {
    _$fullnameAtom.reportRead();
    return super.fullname;
  }

  @override
  set fullname(String? value) {
    _$fullnameAtom.reportWrite(value, super.fullname, () {
      super.fullname = value;
    });
  }

  final _$birthdateAtom = Atom(name: '_LoginErrorBase.birthdate');

  @override
  String? get birthdate {
    _$birthdateAtom.reportRead();
    return super.birthdate;
  }

  @override
  set birthdate(String? value) {
    _$birthdateAtom.reportWrite(value, super.birthdate, () {
      super.birthdate = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginErrorBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginErrorBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$signupAtom = Atom(name: '_LoginErrorBase.signup');

  @override
  String? get signup {
    _$signupAtom.reportRead();
    return super.signup;
  }

  @override
  set signup(String? value) {
    _$signupAtom.reportWrite(value, super.signup, () {
      super.signup = value;
    });
  }

  @override
  String toString() {
    return '''
fullname: ${fullname},
birthdate: ${birthdate},
email: ${email},
password: ${password},
signup: ${signup},
hasErrors: ${hasErrors}
    ''';
  }
}
