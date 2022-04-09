// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validatorcode_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ValidatorCodeViewModel on _ValidatorCodeViewModelBase, Store {
  final _$passwordAtom = Atom(name: '_ValidatorCodeViewModelBase.password');

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

  final _$isLoadingAtom = Atom(name: '_ValidatorCodeViewModelBase.isLoading');

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

  final _$_ValidatorCodeViewModelBaseActionController =
      ActionController(name: '_ValidatorCodeViewModelBase');

  @override
  void validateEmail() {
    final _$actionInfo = _$_ValidatorCodeViewModelBaseActionController
        .startAction(name: '_ValidatorCodeViewModelBase.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_ValidatorCodeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
password: ${password},
isLoading: ${isLoading}
    ''';
  }
}
