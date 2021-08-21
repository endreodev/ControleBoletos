import 'package:flutter/cupertino.dart';

class AuthController {
  var isAuthenticated = false;
  var _user;

  get user => _user;

  void setUser(BuildContext context, var user) {
    if (user != null) {
      _user = user;
      isAuthenticated = true;
    } else {
      isAuthenticated = false;
    }
  }
}
