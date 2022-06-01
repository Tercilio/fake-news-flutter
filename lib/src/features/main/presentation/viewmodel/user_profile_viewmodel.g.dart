// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserProfileViewModel on _UserProfileViewModelBase, Store {
  final _$emailAtom = Atom(name: '_UserProfileViewModelBase.email');

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

  final _$fullnameAtom = Atom(name: '_UserProfileViewModelBase.fullname');

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

  final _$birthdateAtom = Atom(name: '_UserProfileViewModelBase.birthdate');

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

  final _$addressAtom = Atom(name: '_UserProfileViewModelBase.address');

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$photoAtom = Atom(name: '_UserProfileViewModelBase.photo');

  @override
  String get photo {
    _$photoAtom.reportRead();
    return super.photo;
  }

  @override
  set photo(String value) {
    _$photoAtom.reportWrite(value, super.photo, () {
      super.photo = value;
    });
  }

  final _$ageAtom = Atom(name: '_UserProfileViewModelBase.age');

  @override
  String get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  @override
  set age(String value) {
    _$ageAtom.reportWrite(value, super.age, () {
      super.age = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_UserProfileViewModelBase.isLoading');

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
      Atom(name: '_UserProfileViewModelBase.isDateSelected');

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

  final _$isAccountUpdatedAtom =
      Atom(name: '_UserProfileViewModelBase.isAccountUpdated');

  @override
  bool get isAccountUpdated {
    _$isAccountUpdatedAtom.reportRead();
    return super.isAccountUpdated;
  }

  @override
  set isAccountUpdated(bool value) {
    _$isAccountUpdatedAtom.reportWrite(value, super.isAccountUpdated, () {
      super.isAccountUpdated = value;
    });
  }

  final _$_UserProfileViewModelBaseActionController =
      ActionController(name: '_UserProfileViewModelBase');

  @override
  void validateFullname() {
    final _$actionInfo = _$_UserProfileViewModelBaseActionController
        .startAction(name: '_UserProfileViewModelBase.validateFullname');
    try {
      return super.validateFullname();
    } finally {
      _$_UserProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateBirthdate() {
    final _$actionInfo = _$_UserProfileViewModelBaseActionController
        .startAction(name: '_UserProfileViewModelBase.validateBirthdate');
    try {
      return super.validateBirthdate();
    } finally {
      _$_UserProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
fullname: ${fullname},
birthdate: ${birthdate},
address: ${address},
photo: ${photo},
age: ${age},
isLoading: ${isLoading},
isDateSelected: ${isDateSelected},
isAccountUpdated: ${isAccountUpdated}
    ''';
  }
}

mixin _$UserProfileError on _UserProfileErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_UserProfileErrorBase.hasErrors'))
          .value;

  final _$fullnameAtom = Atom(name: '_UserProfileErrorBase.fullname');

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

  final _$birthdateAtom = Atom(name: '_UserProfileErrorBase.birthdate');

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

  final _$updateUserAtom = Atom(name: '_UserProfileErrorBase.updateUser');

  @override
  String get updateUser {
    _$updateUserAtom.reportRead();
    return super.updateUser;
  }

  @override
  set updateUser(String value) {
    _$updateUserAtom.reportWrite(value, super.updateUser, () {
      super.updateUser = value;
    });
  }

  @override
  String toString() {
    return '''
fullname: ${fullname},
birthdate: ${birthdate},
updateUser: ${updateUser},
hasErrors: ${hasErrors}
    ''';
  }
}
