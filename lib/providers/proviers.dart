import 'package:provider/provider.dart';
import 'package:second_project/main.dart';
import 'package:second_project/modules/otp_email/view_model/otp_view_model.dart';
import 'package:second_project/modules/sign_up/view_model/signup_viewmodel.dart';

import '../modules/home/view_model/home_page_viewmodel.dart';
import '../modules/home_page_fullview/view_model/homepagefullview_viewmodel.dart';
import '../modules/home_page_fullview/view_model/map_viewmodel.dart';
import '../modules/sign_in/view_model/signin_controller.dart';
import '../modules/splash/view_model/introduction_screen_provider.dart';
import '../modules/splash/view_model/spash_screen.dart';
import '../modules/time_slot_booking/viewmodel/time_slot_viewmodel.dart';

class Providers {
  static providers() {
    return MultiProvider(providers: [
      ChangeNotifierProvider<SplashPov>(create: (context) => SplashPov()),
      ChangeNotifierProvider(create: ((context) => HomePageProvider())),
      ChangeNotifierProvider(
          create: (((context) => IntroductionScreenProvider()))),
      ChangeNotifierProvider<SignUpViewModel>(
          create: (((context) => SignUpViewModel()))),
      ChangeNotifierProvider<OtpViewModel>(
          create: (((context) => OtpViewModel()))),
      ChangeNotifierProvider<SigninScreenController>(
          create: (((context) => SigninScreenController()))),
      ChangeNotifierProvider<TimeSlotviewModel>(
          create: (((context) => TimeSlotviewModel()))),
      ChangeNotifierProvider<fullpageViewmodel>(
          create: (((context) => fullpageViewmodel()))),
      ChangeNotifierProvider<mapLounch>(create: (((context) => mapLounch()))),
    ], child: const MyApp());
  }
}
