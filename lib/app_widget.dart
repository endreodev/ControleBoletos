import 'package:flutter/material.dart';

import 'modulos/home/home_page.dart';
import 'modulos/login/login_page.dart';
import 'modulos/splash/splash_page.dart';
import 'shared/themes/appcolors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play Flow Boletos',
      theme: ThemeData(primaryColor: AppColors.primary),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage()
      },
    );
  }
}
