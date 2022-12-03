import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:second_project/modules/sign_in/models/login_model.dart';
import 'package:second_project/services/network/base_url/url.dart';
import 'package:second_project/utils/service/services.dart';

class SigninService extends ChangeNotifier {
  Future<SignInResponse?> apiSingnin(SigninModel data) async {
    try {
      Response response = await DioServices.postMethod(
          url: Url.baseUrl + Url.login, value: data.toJson());

      if (response.statusCode == 200) {
        SignInResponse newData = SignInResponse.fromJson(response.data);
        return newData;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        return SignInResponse.fromJson(e.response!.data);
      }
    } catch (e) {
      log("SignIn error message : $e");
    }
    return null;
  }
}
