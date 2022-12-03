// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class BootomSheet extends StatelessWidget {
//   const BootomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child:Container(

//       ))
//     );
//   }
// }

import 'dart:developer';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:second_project/rotes/routes.dart';
import 'package:second_project/utils/res/sizedbox.dart';
import 'package:second_project/utils/res/text.dart';

import '../../../utils/common_widgets/elevatted_button.dart';
import '../../time_slot_booking/view/slot_booking.dart';
import '../../time_slot_booking/viewmodel/time_slot_viewmodel.dart';
import '../view_model/homepagefullview_viewmodel.dart';
import 'snakBar.dart';

bottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        final size = MediaQuery.of(context).size;
        final timeslptViewModel = context.watch<TimeSlotviewModel>();
        final fullpageViewModel = context.watch<fullpageViewmodel>();
        return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 300,
            width: size.width,
            child: Column(
              children: [
                ksizedBox,
                ksizedBox,
                Text(
                  "Pick Your Date",
                  style: TextStyle(
                      fontFamily: commonHeddingtextStyle.fontFamily,
                      fontSize: 20),
                ),
                ksizedBox,
                ksizedBox,
                Row(
                  children: [
                    Consumer<fullpageViewmodel>(
                      builder: (BuildContext context, value, Widget? child) {
                        return Expanded(
                          flex: 6,
                          child: SizedBox(
                            child: DatePicker(
                              fullpageViewModel.selectedtime,
                              initialSelectedDate:
                                  fullpageViewModel.selectedtime,
                              selectionColor:
                                  const Color.fromARGB(255, 11, 94, 2),
                              selectedTextColor: Colors.white,
                              onDateChange: (date) {
                                // print(date);
                                // fullpageViewModel.DatetimeNow = date;
                                // fullpageViewModel.timecheck(date);
                              },
                              daysCount: 5,
                            ),
                          ),
                        );
                      },
                    ),
                    Expanded(
                        child: IconButton(
                      onPressed: () {
                        fullpageViewModel.customDatePicker(context);
                        timeslptViewModel.clearlist();
                      },
                      icon: const Icon(
                        Icons.date_range_sharp,
                        color: Color.fromARGB(255, 0, 87, 158),
                      ),
                    )),
                  ],
                ),
                ksizedBox,
                ksizedBox,
                ksizedBox,
                loginPageButton(
                  action: () async {
                    bottomSheet(context);
                    // if (fullpageViewModel.selectedtime == null) {
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // }
                    // await fullpageViewModel.fetchDetails();
                    // await fullpageViewModel.addingtoList();
                    // await fullpageViewModel.fetchDetails();
                    // await fullpageViewModel.alredybooked();
                    Routes.push(screen: const SlotBooking());
                  },
                  width: size.width * 0.8,
                  text: 'Availabe Slotes',
                  hight: size.height * 1,
                ),
              ],
            ),
          )
        ]);
      });
}
