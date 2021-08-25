import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nlw_application/modulos/barcode/barcode_page.dart';
import 'package:nlw_application/modulos/insert_boleto/insert_boleto.dart';

import 'modulos/home/home_page.dart';
import 'modulos/login/login_page.dart';
import 'modulos/splash/splash_page.dart';
import 'shared/themes/appcolors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Play Flow Boletos',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),

      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/barcode": (context) => BarcodeScannerPage(),
        "/insertBoleto": (context) => InsertBoletoPage()
      },
      //home: SplashPage(),
    );
  }
}
