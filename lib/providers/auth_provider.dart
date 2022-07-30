import 'package:flutter/foundation.dart';

class Auth with ChangeNotifier {
  var _token;
  var _expiryDate;
  String _userId = '';
  var _authTimer;

  bool get isAuth {
    return _token != null;
  }

  String get userid {
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

  Future<void> login(String email, String password) async {
    print("Login using $email $password");
  }
}
