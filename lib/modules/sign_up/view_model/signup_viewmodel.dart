import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:second_project/modules/otp_email/view/otp_email.dart';
import 'package:second_project/modules/sign_in/services/storage.dart';
import 'package:second_project/modules/sign_up/model/model.dart';
import 'package:second_project/modules/sign_up/services/singup_service.dart';
import 'package:second_project/rotes/routes.dart';

class SignUpViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final SecureStorage newinstance = SecureStorage();

  String? newId;

  Future<void> signUp(context) async {
    final SignupModel data = SignupModel(
        email: emailController.text.toString(),
        pass: passwordController.text.toString());

    SignupResponce? signupResponse = await SignUpService().apiCall(data);

    if (signupResponse != null) {
      newId = signupResponse.id;
      if (signupResponse.status == true) {
        // navigatation
        //  print(signupResponse.status.toString());
        Routes.pushreplace(screen: const OtpVerificationView());
      } else {
        //  print(signupResponse.status.toString());
      }
    } else {
      log("network issue");
    }
  }
}
