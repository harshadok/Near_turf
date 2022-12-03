import 'package:dio/dio.dart';
import 'package:second_project/helper/interseptors.dart';

class DioServicesfullview {
  static Future<dynamic> getMethod(var id) async {
    Dio dio = await InterceptorHelper().getApiClient();
    return await dio
        .get("https://fauxspot.herokuapp.com/account/get-booking/${id}")
        .then((value) => value);
  }
}
