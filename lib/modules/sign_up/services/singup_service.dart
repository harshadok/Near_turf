import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:second_project/modules/sign_up/model/model.dart';
import 'package:second_project/services/network/base_url/url.dart';
import 'package:second_project/utils/service/services.dart';

class SignUpService extends ChangeNotifier {
  Future<SignupResponce?> apiCall(SignupModel data) async {
    try {
      Response response = await DioServices.postMethod(
          url: Url.baseUrl + Url.signup, value: data.toJson());

      if (response.statusCode == 200) {
        SignupResponce newData = SignupResponce.fromJson(response.data);

        // if (kDebugMode) {
        //   print(newData.id);
        // }
        return newData;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        return SignupResponce.fromJson(e.response!.data);
      }
    } catch (e) {
      log("SignUp error message : $e");
      // print(e);
    }
    return null;
  }
}
