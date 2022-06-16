// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detector_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsDetectorViewModel on _NewsDetectorViewModelBase, Store {
  final _$bodyAtom = Atom(name: '_NewsDetectorViewModelBase.body');

  @override
  String get body {
    _$bodyAtom.reportRead();
    return super.body;
  }

  @override
  set body(String value) {
    _$bodyAtom.reportWrite(value, super.body, () {
      super.body = value;
    });
  }

  final _$isNewsDetectedAtom =
      Atom(name: '_NewsDetectorViewModelBase.isNewsDetected');

  @override
  bool get isNewsDetected {
    _$isNewsDetectedAtom.reportRead();
    return super.isNewsDetected;
  }

  @override
  set isNewsDetected(bool value) {
    _$isNewsDetectedAtom.reportWrite(value, super.isNewsDetected, () {
      super.isNewsDetected = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_NewsDetectorViewModelBase.isLoading');

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

  final _$_NewsDetectorViewModelBaseActionController =
      ActionController(name: '_NewsDetectorViewModelBase');

  @override
  void validateBody() {
    final _$actionInfo = _$_NewsDetectorViewModelBaseActionController
        .startAction(name: '_NewsDetectorViewModelBase.validateBody');
    try {
      return super.validateBody();
    } finally {
      _$_NewsDetectorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
body: ${body},
isNewsDetected: ${isNewsDetected},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$NewsDetectorError on _NewsDetectorErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_NewsDetectorErrorBase.hasErrors'))
          .value;

  final _$bodyAtom = Atom(name: '_NewsDetectorErrorBase.body');

  @override
  String? get body {
    _$bodyAtom.reportRead();
    return super.body;
  }

  @override
  set body(String? value) {
    _$bodyAtom.reportWrite(value, super.body, () {
      super.body = value;
    });
  }

  @override
  String toString() {
    return '''
body: ${body},
hasErrors: ${hasErrors}
    ''';
  }
}
