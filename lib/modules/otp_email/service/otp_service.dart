import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:second_project/utils/service/services.dart';

import '../../../services/network/base_url/url.dart';
import '../model/otp_model.dart';

class EmailOtpApi {
  emailOtpApi(newdata) async {
    try {
      Response response = await DioServices.postMethod(
        url: Url.baseUrl + Url.otp,
        value: newdata.toJson(),
      );
      print(" datas :${response.data}");
      if (response.statusCode == 200) {
        return OtpModelResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      log("Dio Error message: ${e.error}");
      return OtpModelResponse.fromJson(e.response!.data);
    } catch (e) {
      log("Verify otp error message: $e");
    }
  }
}
