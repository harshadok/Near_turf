import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:second_project/modules/home_page_fullview/model/model_fullview.dart';
import 'package:second_project/modules/home_page_fullview/service/service_methods.dart';
import 'package:second_project/modules/time_slot_booking/model/bookig_post_model.dart';
import 'package:second_project/services/network/base_url/url.dart';
import 'package:second_project/utils/service/services.dart';

import '../../time_slot_booking/model/booking_model.dart';

class homefullservice {
  Future<BookingResponse?> getTuftDatawithId(id) async {
    try {
      var turfid = id;
      Response response = await DioServicesfullview.getMethod(turfid);
      if (response.statusCode == 200) {
        return BookingResponse.fromJson(response.data);
      }
    } on DioError {
      log("Dio eroor");
    } catch (e) {
      log("home api error meassage : $e");
    }
    return null;
  }

  Future<BookingPostModelresponce?> bookSlot(BookingPostModel data) async {
    try {
      Response response = await DioServices.postMethod(
          url: Url.baseUrl + Url.booking, value: data.toJson());

      if (response.statusCode == 200) {
        BookingPostModelresponce newData =
            BookingPostModelresponce.fromJson(response.data);
        log(newData.message.toString());
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        // return SignInResponse.fromJson(e.response!.data);
      }
    } catch (e) {
      log("SignIn error message : $e");
    }
    return null;
  }
}
