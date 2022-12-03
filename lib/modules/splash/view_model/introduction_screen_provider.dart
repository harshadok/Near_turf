import 'package:flutter/widgets.dart';
import 'package:second_project/rotes/routes.dart';
import 'package:second_project/modules/bottom_navigation/view/route_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionScreenProvider extends ChangeNotifier {
  Future addToShared() async {
    await saveUserData();
    Routes.pushreplace(screen: BottomNavigationPage());
  }

  saveUserData() async {
    final obj = await SharedPreferences.getInstance();
    obj.setBool('userLoged', true);
  }
}
