// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpViewModel on _SignUpViewModelBase, Store {
  final _$firstnameAtom = Atom(name: '_SignUpViewModelBase.firstname');

  @override
  String get firstname {
    _$firstnameAtom.reportRead();
    return super.firstname;
  }

  @override
  set firstname(String value) {
    _$firstnameAtom.reportWrite(value, super.firstname, () {
      super.firstname = value;
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

  final _$_SignUpViewModelBaseActionController =
      ActionController(name: '_SignUpViewModelBase');

  @override
  void validateFirstUsername() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.validateFirstUsername');
    try {
      return super.validateFirstUsername();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLastUsername() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.validateLastUsername');
    try {
      return super.validateLastUsername();
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
firstname: ${firstname},
email: ${email},
password: ${password},
isLoading: ${isLoading}
    ''';
  }
}
