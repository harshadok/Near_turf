import 'dart:async';

import 'package:flutter/material.dart';
import 'package:second_project/rotes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../sign_in/view/login_screen.dart';
import '../view/splash_screens/introduction_screen.dart';

class SplashPov extends ChangeNotifier {
  SplashPov() {
    checkUserLogin();
  }

  void checkUserLogin() async {
    final obj = await SharedPreferences.getInstance();
    bool data = obj.getBool('userLoged') ?? false;

    Timer(
      const Duration(seconds: 2),
      () => data
          ? Routes.pushreplace(
              screen: Loginscreen(),
            )
          : Routes.pushreplace(
              screen: SplashScreen(),
            ),
    );
  }
}
