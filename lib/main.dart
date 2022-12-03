import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/modules/bottom_navigation/view/route_screen.dart';
import 'package:second_project/modules/home/view/location.dart';
import 'package:second_project/modules/home/view_model/location_view_model.dart';
import 'package:second_project/modules/search/view/search_view.dart';
import 'package:second_project/modules/splash/view/splash_screens/introduction_screen.dart';
import 'package:second_project/modules/splash/view/splash_screens/splash_screen.dart';
import 'package:second_project/providers/proviers.dart';
import 'package:second_project/modules/splash/view_model/introduction_screen_provider.dart';
import 'package:second_project/modules/splash/view_model/spash_screen.dart';

import 'modules/home/view_model/home_page_viewmodel.dart';
import 'rotes/routes.dart';

void main() {
  runApp((Providers.providers()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SplashPov>(create: (context) => SplashPov()),
          ChangeNotifierProvider(create: ((context) => HomePageProvider())),
          ChangeNotifierProvider(
              create: (((context) => IntroductionScreenProvider())))
        ],
        child: MaterialApp(
          navigatorKey: Routes.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.grey),
          home: BottomNavigationPage(),
        ));
  }
}
