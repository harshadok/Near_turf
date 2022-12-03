import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:second_project/modules/bottom_navigation/view/route_screen.dart';
import 'package:second_project/modules/home/view_model/location_view_model.dart';
import 'package:second_project/modules/sign_in/models/login_model.dart';
import 'package:second_project/modules/sign_in/services/signin_api_services.dart';

import '../../../rotes/routes.dart';

class SigninScreenController extends ChangeNotifier {
  final fullNameController = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  final passwordController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isObscure = true;

  //RxBool loading = false.obs;
  bool? isloading = false;

  //RxBool loading  = false.obs;
  lodingfunction() async {
    isloading = true;
    notifyListeners();
    await signInFunction();
    isloading = false;
    notifyListeners();
  }

  signInFunction() async {
    SigninModel data = SigninModel(
        userMail: emailController.text.toString(),
        userPassword: passwordController.text.toString());
    SignInResponse? signInResponse = await SigninService().apiSingnin(data);

    if (signInResponse!.status != null) {
      storage.write(key: "token", value: signInResponse.token);
      // print("haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaai");
      //  print(signInResponse.id);
      Routes.push(screen: const MapView());
    } else {
      log("no data");
    }
  }

  passwordHIde() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
