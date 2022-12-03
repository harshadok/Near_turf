import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:second_project/rotes/routes.dart';

import '../../bottom_navigation/view/route_screen.dart';

enum CheckTime { booked, timeexpired, available }

class TimeSlotviewModel extends ChangeNotifier {
  List<String> selectedtimemornig = [];
  List<String>? selectedtinoon = [];
  List<String>? selectedtinight = [];

  List<int> AddtoSlotList = [];

  clearlist() {
    selectedtimemornig.clear();
    selectedtinoon!.clear();
    selectedtinight!.clear();
  }

  bool? isSelected;
  int? mornigPrice = 1000;
  int? noonPrice = 800;
  int? nightPrice = 1500;
  int? totalAmound;
  chnageChip(bool chnage) {
    isSelected = chnage;
    notifyListeners();
  }

  int turfAmound() {
    int moringListlenght = selectedtimemornig.length;
    int noonlistlenght = selectedtinoon!.length;
    int nightlenght = selectedtinight!.length;
    int totalPrice =
        moringListlenght * 1000 + noonlistlenght * 800 + nightlenght * 1500;
    return totalPrice;
  }

  postList() {
    List<int> postListMornig = [];
    List<int> postListnoon = [];
    List<int> postListnight = [];
    postListMornig.clear();
    postListnoon.clear();
    postListnight.clear();
    AddtoSlotList.clear();

    // Mornig
    for (int i = 0; i < selectedtimemornig.length; i++) {
      String currentDate = selectedtimemornig[i];
      List datelist = currentDate.split(':');
      int chgetoint = int.parse(datelist.first);
      postListMornig.add(chgetoint);
    }
    for (int i = 0; i < selectedtinoon!.length; i++) {
      String currentDate = selectedtinoon![i];
      List datelist = currentDate.split(':');
      int chgetoint = int.parse(datelist.first);
      int covereted = chgetoint + 12;
      postListnoon.add(covereted);
    }
    for (int i = 0; i < selectedtinight!.length; i++) {
      String currentDate = selectedtinight![i];
      List datelist = currentDate.split(':');
      int chgetoint = int.parse(datelist.first);
      int covereted = chgetoint + 12;
      postListnight.add(covereted);
    }
    AddtoSlotList = postListMornig + postListnoon + postListnight;
    log(AddtoSlotList.length.toString());
    notifyListeners();
  }

  paymentFUnactio() {
    if (AddtoSlotList.isNotEmpty) {
      option();
    }
    notifyListeners();
  }

  bool payment = false;

  late Razorpay _razorpay;
  TimeSlotviewModel() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSucess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    notifyListeners();
  }

  void _handlePaymentSucess() {
    Routes.pushreplace(screen: BottomNavigationPage());
  }

  _handlePaymentError() {
    // Get.snackbar("Payment Failed", '');
    log("payment Fauled");
  }

  _handleExternalWallet() {
    log("hanlde error");
  }

  option() {
    var options = {
      "key": "rzp_test_b4n3Mmr5YHI40h",
      "amount": turfAmound() * 100,
      "name": "new project",
      "description": "payment for our work",
      "prefill": {"contact": "7055451245", "email": "mveli620@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      //print(e.toString());
    }
  }
}
