import 'package:flutter/foundation.dart';

class Auth with ChangeNotifier {
  var _token;
  var _expiryDate;
  String _userId = '';
  var _authTimer;

  bool get isAuth {
    return _token != null;
  }

  String get userId {
    return _userId;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  /* Awaiting backend login */
  Future<void> login(String phoneNumber, String password) async {
    print("Login using $phoneNumber $password");
  }

  Future<void> signUp(
      String userName, String phoneNumber, String password) async {
    print("Signing Up");
  }
}
