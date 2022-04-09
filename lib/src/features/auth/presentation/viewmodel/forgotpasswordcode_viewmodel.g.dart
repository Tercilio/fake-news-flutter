// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgotpasswordcode_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordCodeViewModel on _ForgotPasswordCodeViewModelBase, Store {
  final _$codeAtom = Atom(name: '_ForgotPasswordCodeViewModelBase.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$isLoadingAtom =
      Atom(name: '_ForgotPasswordCodeViewModelBase.isLoading');

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

  final _$_ForgotPasswordCodeViewModelBaseActionController =
      ActionController(name: '_ForgotPasswordCodeViewModelBase');

  @override
  void validateCode() {
    final _$actionInfo = _$_ForgotPasswordCodeViewModelBaseActionController
        .startAction(name: '_ForgotPasswordCodeViewModelBase.validateCode');
    try {
      return super.validateCode();
    } finally {
      _$_ForgotPasswordCodeViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
code: ${code},
isLoading: ${isLoading}
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

  final _$codeAtom = Atom(name: '_LoginErrorBase.code');

  @override
  String? get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String? value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  @override
  String toString() {
    return '''
code: ${code},
hasErrors: ${hasErrors}
    ''';
  }
}
