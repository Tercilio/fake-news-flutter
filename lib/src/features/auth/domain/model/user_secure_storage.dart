import 'package:basearch/src/features/auth/data/dto/user_output_dto.dart';

class UserSecureStorage {
  // static const _storage = FlutterSecureStorage();

  static int _valueUserId = -1;
  static String _valueUserName = "";
  static String _valueUserPhoto = "";
  static String _valueUserBirthday = "";
  static String _valueUserEmail = "";
  static String _valueUserAddress = "";
  static String _valueUserToken = "";

  static int getUserid() {
    return _valueUserId;
  }

  static void setUserid(int userid) {
    _valueUserId = userid;
  }

  static String getUsername() {
    return _valueUserName;
  }

  static void setUsername(String username) {
    _valueUserName = username;
  }

  static String getUserphoto() {
    return _valueUserPhoto;
  }

  static void setUserphoto(String userphoto) {
    _valueUserPhoto = userphoto;
  }

  static String getUserbirthday() {
    return _valueUserBirthday;
  }

  static void setUserbirthday(String userbirthday) {
    _valueUserBirthday = userbirthday;
  }

  static String getUserAddress() {
    return _valueUserAddress;
  }

  static void setUserAddress(String useraddress) {
    _valueUserAddress = useraddress;
  }

  static String getUseremail() {
    // return await _storage.read(key: _keyUserEmail);
    return _valueUserEmail;
  }

  static void setUseremail(String useremail) {
    // return await _storage.write(key: _keyUserEmail, value: useremail);
    _valueUserEmail = useremail;
  }

  static String getUsertoken() {
    // return await _storage.read(key: _keyUserToken);
    return _valueUserToken;
  }

  static void setUsertoken(String? usertoken) {
    // return await _storage.write(key: _keyUserToken, value: usertoken);
    _valueUserToken = usertoken!;
  }

  static UserOutputDto getUser() {
    return UserOutputDto(_valueUserId, _valueUserName, _valueUserBirthday,
        _valueUserAddress, _valueUserEmail, _valueUserPhoto, _valueUserToken);
  }

  static void setUser(UserOutputDto user) {
    _valueUserId = user.id;
    _valueUserName = user.fullname.isEmpty ? "" : user.fullname;
    _valueUserPhoto = user.photo.isEmpty ? "" : user.photo;
    _valueUserBirthday = user.birthdate.isEmpty ? "" : user.birthdate;
    _valueUserEmail = user.email.isEmpty ? "" : user.email;
    _valueUserToken = user.token.isEmpty ? "" : user.token;
    _valueUserAddress = user.address.isEmpty ? "" : user.address;
  }

  static void resetUser() {
    _valueUserId = -1;
    _valueUserName = "";
    _valueUserPhoto = "";
    _valueUserBirthday = "";
    _valueUserEmail = "";
    _valueUserToken = "";
    _valueUserAddress = "";
  }
}
