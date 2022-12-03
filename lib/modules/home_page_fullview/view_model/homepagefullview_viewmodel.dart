// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:second_project/modules/home/model/home_turf_model.dart';
import 'package:second_project/modules/home_page_fullview/model/model_fullview.dart';
import 'package:second_project/modules/home_page_fullview/service/services.dart';
import 'package:second_project/modules/home_page_fullview/widgets/snakBar.dart';
import 'package:second_project/modules/time_slot_booking/model/bookig_post_model.dart';

import '../../time_slot_booking/model/booking_model.dart';

// ignore: camel_case_types
class fullpageViewmodel extends ChangeNotifier {
  bool isLoading = false;
  int? mornigStarttime;
  int? mornigend;
  int? noonstart;
  int? noonend;
  int? nightstart;
  int? nightend;
  String? listItem;
  String? expirecheck;
  // ignore: prefer_typing_uninitialized_variables
  var id;
  // all list _____________________________________
  List<String> mornigList = [];
  List<String> noonList = [];
  List<String> nightList = [];
  // time exprechecklist _--------------------------------------------
  List<String> morniglistint = [];
  List<String> noonlistint = [];
  List<String> nightlistint = [];
  // alredy booked list-------------------------
  List<String> mornigalredybooked = [];
  List<String> noonalredybooked = [];
  List<String> nightalredybooked = [];
  // alredybooked deffrentdate

  List<String> ALredybookeddeffrentDate = [];

  // ignore: prefer_typing_uninitialized_variables
  int timeNow = DateTime.now().hour;
  int dateToday = DateTime.now().day;
  DateTime DatetimeNow = DateTime.now();
  DateTime selectedtime = DateTime.now();
  String? slectedDay;
  Datum? data;
  int? currentindex;
  fullpageViewmodel() {
    inInit();
  }

  List<BookingList> Alredybookedlist = [];

  inInit() async {
    isLoading = true;
    notifyListeners();
    await fetchDetails();
    isLoading = false;
    notifyListeners();
  }

  Future fetchDetails() async {
    BookingResponse? response = await homefullservice().getTuftDatawithId(id);
    if (response!.data != null) {
      if (response.status == true) {
        Alredybookedlist.clear();
        Alredybookedlist.addAll(response.data!);
        log(" haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaoii${Alredybookedlist.length.toString()}");
      }
      notifyListeners();
    }

    notifyListeners();
  }

  indexcheck() {
    noonalredybooked.clear();
    mornigalredybooked.clear();
    nightalredybooked.clear();

    for (int i = 0; i < ALredybookeddeffrentDate.length; i++) {
      if (ALredybookeddeffrentDate[i] == slectedDay) {
        currentindex = i;
        int currentlistslotlenght = Alredybookedlist[i].timeSlot!.length;
        List currentlist = Alredybookedlist[i].timeSlot!;
        for (int k = 0; k < currentlistslotlenght; k++) {
          int f = currentlist[k];
          if (f < 12) {
            int j = f;
            expirecheck = "$j:00 - ${j + 1}:00";
            mornigalredybooked.add(expirecheck.toString());
            j--;
          } else if (12 <= f && f <= 16) {
            int j = f - 12;
            int d = j;
            expirecheck = "$d:00 - ${d + 1}:00";
            log(expirecheck.toString());
            noonalredybooked.add(expirecheck.toString());
          } else if (f > 16) {
            int j = f - 12;
            int d = j;
            expirecheck = "$d:00 - ${d + 1}:00";
            log(expirecheck.toString());
            //print(expirecheck);
            nightalredybooked.add(expirecheck.toString());
          }
        }
      } else {
        log("No Already booked exist");
      }
    }
    datesameCheck();
    notifyListeners();
  }

  alredybookdSamedate() {
    noonalredybooked.clear();
    mornigalredybooked.clear();
    nightalredybooked.clear();
  }

  datesameCheck() {
    ALredybookeddeffrentDate.clear();
    for (int i = 0; i < Alredybookedlist.length; i++) {
      String date = Alredybookedlist[i].bookingDate.toString();
      List datelist = date.split('/');
      String currentDate = datelist[1];
      ALredybookeddeffrentDate.add(currentDate);
      log(ALredybookeddeffrentDate[i]);
    }
    notifyListeners();
  }

  customDatePicker(BuildContext context) async {
    selectedtime = (await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 0, 51, 2),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: selectedtime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    ))!;
    timecheck(selectedtime);
    slectedDay = selectedtime.day.toString();
    datesameCheck();
    indexcheck();
    notifyListeners();
  }

  timecheck(DateTime time) {
    if (selectedtime != DatetimeNow) {
      DatetimeNow = time;
      indexcheck();
      slectedDay = time.day.toString();
      indexcheck();
      if (dateToday != selectedtime.day) {
        morniglistint.clear();
        noonlistint.clear();
        nightlistint.clear();

        notifyListeners();
      } else {
        timeexpireCheck();
      }
    }
    notifyListeners();
  }

  addingtoList() {
    if (data != null) {
      mornigList.clear();
      nightList.clear();
      noonList.clear();
      mornigStarttime = data!.turfTime!.timeMorningStart;
      mornigend = data!.turfTime!.timeMorningEnd;

      nightstart = data!.turfTime!.timeEveningStart;

      nightend = data!.turfTime!.timeEveningEnd;
      noonstart = data!.turfTime!.timeAfternoonStart;
      noonend = data!.turfTime!.timeAfternoonEnd;

      for (int i = mornigStarttime!; i < mornigend!; i++) {
        listItem = "$i:00 - ${i + 1}:00";
        mornigList.add(listItem.toString());
        //print(mornigList);
      }
      for (int i = noonstart! - 12; i < noonend! - 12; i++) {
        listItem = "$i:00 - ${i + 1}:00";
        noonList.add(listItem.toString());
      }
      for (int i = nightstart! - 12; i < nightend! - 12; i++) {
        listItem = "$i:00 - ${i + 1}:00";
        nightList.add(listItem.toString());
      }
      notifyListeners();
    } else {
      notifyListeners();
    }
    notifyListeners();
  }

  timeexpireCheck() {
    nightlistint.clear();
    morniglistint.clear();
    noonlistint.clear();
    for (int i = mornigStarttime!; i <= timeNow && i <= mornigend!; i++) {
      expirecheck = "$i:00 - ${i + 1}:00";
      morniglistint.add(expirecheck.toString());
      //  print(mornigList);
    }
    for (int i = noonstart! - 12;
        i <= timeNow - 12 && i <= noonend! - 12;
        i++) {
      expirecheck = "$i:00 - ${i + 1}:00";
      noonlistint.add(expirecheck.toString());
    }

    for (int i = nightstart! - 12;
        i < timeNow - 12 && i <= nightend! - 12;
        i++) {
      expirecheck = "$i:00 - ${i + 1}:00";
      nightlistint.add(expirecheck.toString());
    }
    notifyListeners();
  }

  addToDatabase(context, List<int> databasseSlot) async {
    log('Turf ID :$id');
    if (databasseSlot.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarr);
    } else {
      BookingPostModel data = BookingPostModel(
        turfId: id,
        bookingDate: DateFormat.yMd().format(selectedtime),
        timeSlot: databasseSlot,
      );

      BookingPostModelresponce? bookingResponce =
          await homefullservice().bookSlot(data);
      if (bookingResponce == null) {
        return null;
      }
      if (bookingResponce.status == true) {
        log(bookingResponce.message.toString());
      } else {
        log("Errrrrrrrrrrrrrrrrrrrrrrrrror");
      }
      log("DAta base valu ${databasseSlot.toString()}");
    }

    notifyListeners();
  }
}
