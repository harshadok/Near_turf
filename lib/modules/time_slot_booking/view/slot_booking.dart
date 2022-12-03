import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/modules/time_slot_booking/view/warp_widget.dart';
import 'package:second_project/utils/res/sizedbox.dart';
import 'package:second_project/utils/res/text.dart';

import '../../home_page_fullview/view_model/homepagefullview_viewmodel.dart';
import '../viewmodel/time_slot_viewmodel.dart';

class SlotBooking extends StatefulWidget {
  const SlotBooking({super.key});

  @override
  State<SlotBooking> createState() => _SlotBookingState();
}

class _SlotBookingState extends State<SlotBooking> {
  // List<String>? selectedHobby = [];

  @override
  Widget build(BuildContext context) {
    final timeslptViewModel = context.watch<TimeSlotviewModel>();
    final fullpageViewModel = context.watch<fullpageViewmodel>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(fullpageViewModel.data!.turfName!),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
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
                          initialSelectedDate: fullpageViewModel.selectedtime,
                          selectionColor: const Color.fromARGB(255, 11, 94, 2),
                          selectedTextColor: Colors.white,
                          onDateChange: (date) {
                          
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Text(
                    "Mornig",
                    style: commonHeddingtextStyle.copyWith(fontSize: 20),
                  ),
                  const Spacer(),
                  Text(
                    "1000",
                    style: commonHeddingtextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
            ksizedBox,
            Multiple_slection(
                context,
                fullpageViewModel.mornigList,
                fullpageViewModel.morniglistint,
                timeslptViewModel.selectedtimemornig,
                fullpageViewModel.mornigalredybooked),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Noon",
                    style: commonHeddingtextStyle.copyWith(fontSize: 20),
                  ),
                  const Spacer(),
                  Text(
                    "800",
                    style: commonHeddingtextStyle.copyWith(fontSize: 20),
                  )
                ],
              ),
            ),
            ksizedBox,
            Multiple_slection(
              context,
              fullpageViewModel.noonList,
              fullpageViewModel.noonlistint,
              timeslptViewModel.selectedtinoon!,
              fullpageViewModel.noonalredybooked,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Night",
                    style: commonHeddingtextStyle.copyWith(fontSize: 20),
                  ),
                  const Spacer(),
                  Text(
                    "1500",
                    style: commonHeddingtextStyle.copyWith(fontSize: 20),
                  )
                ],
              ),
            ),
            ksizedBox,
            Multiple_slection(
                context,
                fullpageViewModel.nightList,
                fullpageViewModel.nightlistint,
                timeslptViewModel.selectedtinight!,
                fullpageViewModel.nightalredybooked),
            ksizedBox,
            ksizedBox,
            ksizedBox,
            ksizedBox,
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: Card(
                    child: Center(
                      child: Text(
                        "Price :  ${timeslptViewModel.turfAmound()}",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: commontextStyle.fontFamily),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          timeslptViewModel.postList();
                          fullpageViewModel.addToDatabase(
                              context, timeslptViewModel.AddtoSlotList);
                          timeslptViewModel.paymentFUnactio();
                        },
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                              fontFamily: commonHeddingtextStyle.fontFamily),
                        ))),
              ],
            )
          ],
        ),
      )),
    );
  }
}
