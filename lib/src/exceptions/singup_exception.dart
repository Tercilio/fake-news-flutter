class SingUpException implements Exception {
  final dynamic message;

  SingUpException([this.message]);

  @override
  String toString() {
    Object? message = this.message;

    if (message == null) return "Exception";

    return "$message";
  }
}
