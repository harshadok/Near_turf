import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/modules/time_slot_booking/viewmodel/time_slot_viewmodel.dart';
import 'package:second_project/modules/time_slot_booking/widgets/snakbar.dart';

// ignore: non_constant_identifier_names
Multiple_slection(BuildContext context, List fullitems, List timeexpiredlist,
    List selecteditem, List alredyboked) {
  return Consumer<TimeSlotviewModel>(
    builder: (BuildContext context, value, Widget? child) {
      return Wrap(
        children: fullitems.map(
          (time) {
            value.isSelected = false;

            if (timeexpiredlist.contains(time)) {
              value.isSelected = true;
            }
            if (alredyboked.contains(time)) {
              value.isSelected = true;
            }

            if (selecteditem.contains(time)) {
              value.isSelected = true;
            }

            return GestureDetector(
              onTap: () {
                if (timeexpiredlist.contains(time)) {
                  log("not availabel");
                  ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                } else if (alredyboked.contains(time)) {
                  log("Not Available");
                  ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                } else if (selecteditem.contains(time)) {
                  selecteditem.removeWhere((element) => element == time);
                  value.chnageChip(false);
                } else {
                  selecteditem.add(time);
                  value.isSelected = true;
                  value.chnageChip(true);
                  log("available");
                }
              },
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                            color:
                                value.isSelected! ? Colors.black : Colors.grey,
                            width: 2)),
                    child: Text(
                      time,
                      style: TextStyle(
                          color: value.isSelected! ? Colors.red : Colors.green,
                          fontSize: 20),
                    ),
                  )),
            );
          },
        ).toList(),
      );
    },
  );
}
