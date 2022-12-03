import 'package:flutter/material.dart';
import 'package:second_project/modules/home/model/home_turf_model.dart';

import '../service/home_service.dart';

class HomePageProvider extends ChangeNotifier {
  int curentIndex = 1;
  // ignore: prefer_typing_uninitialized_variables
  var id;
  bool isLoading = false;
  String? currentLocation;
  String? currentDistrict;
  HomePageProvider() {
    inInit();
  }

  inInit() async {
    isLoading = true;
    notifyListeners();
    await fetchDetails();
    isLoading = false;
    notifyListeners();
  }

  int activeindex = 0;
  int activeindexstable = 0;
  List<Datum> homeTurfList = [];

  Future fetchDetails() async {
    HomeTurfModel? response = await HomeApiService().getTuftData();

    // ignore: unnecessary_null_comparison
    if (response!.data == null) {
    } else {
      homeTurfList.clear();
      homeTurfList.addAll(response.data);
    }

    notifyListeners();
  }

  bottomChange(value) {
    curentIndex = value;
    notifyListeners();
  }

  cardChangedstableIndex(value) {
    activeindexstable = value;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  HomePageCardAuto(value) {
    activeindex = value;
    notifyListeners();
  }
}
