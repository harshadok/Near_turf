import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:second_project/modules/home/model/home_turf_model.dart';
import 'package:second_project/utils/service/services.dart';

class HomeApiService {
  Future<HomeTurfModel?> getTuftData() async {
    try {
      Response response = await DioServices.getMethod();
      if (response.statusCode == 200) {
        final data = HomeTurfModel.fromJson(response.data);

        return data;
      }
    } on DioError {
      //
    } catch (e) {
      log("home api error meassage : $e");
    }
    return null;
  }
}
