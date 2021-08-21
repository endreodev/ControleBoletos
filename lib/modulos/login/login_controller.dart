import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nlw_application/shared/auth/auth_controller.dart';

class LoginController {
  Future<void> googleSignIn(BuildContext context) async {
    final authController = AuthController();

    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();

      authController.setUser(context, "endreo");

      print(response);
    } catch (error) {
      print(error);
    }
  }
}
