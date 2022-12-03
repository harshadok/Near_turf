import 'package:dio/dio.dart';
import 'package:second_project/helper/interseptors.dart';

class DioServices {
  static Future<dynamic> postMethod(
      {required String url, required value}) async {
    Dio dio = await InterceptorHelper().getApiClient();
    return await dio.post(url, data: value).then((value) => value);
  }

  static Future<dynamic> getMethod() async {
    Dio dio = await InterceptorHelper().getApiClient();
    return await dio
        .get("https://near-turf.herokuapp.com/user/nearest-turf/Malappuram")
        .then((value) => value);
  }
}
