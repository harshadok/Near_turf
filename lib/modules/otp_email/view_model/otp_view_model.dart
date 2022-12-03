import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:second_project/modules/bottom_navigation/view/route_screen.dart';

import '../../../rotes/routes.dart';
import '../model/otp_model.dart';
import '../service/otp_service.dart';

class OtpViewModel extends ChangeNotifier {
  final one = TextEditingController();
  final two = TextEditingController();
  final three = TextEditingController();
  final four = TextEditingController();

  void verifyOtp(
    context,
    id,
  ) async {
    final otp = {one.text + two.text + three.text + four.text};
    final codeQ = otp.join().toString();

    OtpModel newdata = OtpModel(
      id: id,
      userOtp: codeQ,
    );

    OtpModelResponse result = await EmailOtpApi().emailOtpApi(newdata);
    print(result.status);

    if (result.status) {
      Routes.push(screen: BottomNavigationPage());
      //  Navigator.pushNamedAndRemoveUntil(
      //    context, BottomNavView.id, (route) => false);
    } else {
      log("no data");
    }
  }
}
