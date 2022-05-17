class UserSecureStorage {
  // static const _storage = FlutterSecureStorage();

  static String _valueUserEmail = "";

  static String _valueUserToken = "";

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
}
