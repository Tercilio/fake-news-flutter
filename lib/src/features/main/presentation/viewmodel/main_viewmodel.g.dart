// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainViewModel on _MainViewModelBase, Store {
  final _$newsDataAtom = Atom(name: '_MainViewModelBase.newsData');

  @override
  List<News> get newsData {
    _$newsDataAtom.reportRead();
    return super.newsData;
  }

  @override
  set newsData(List<News> value) {
    _$newsDataAtom.reportWrite(value, super.newsData, () {
      super.newsData = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_MainViewModelBase.isLoading');

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

  @override
  String toString() {
    return '''
newsData: ${newsData},
isLoading: ${isLoading}
    ''';
  }
}
