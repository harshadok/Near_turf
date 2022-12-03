import 'package:flutter/material.dart';
import 'package:second_project/components/button_widget.dart';
import 'package:second_project/utils/res/colors.dart';
import 'package:second_project/utils/res/style.dart';
import 'package:second_project/utils/res/text.dart';

class TurfContainer extends StatelessWidget {
  final String turfName;
  final String trufPlace;
  final turfImage;
  final bool visible;
  const TurfContainer(
      {Key? key,
      required this.visible,
      required this.turfName,
      required this.trufPlace, this.turfImage, required Null Function() cardOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration.copyWith(
        color: grey,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(100),
          topLeft: Radius.circular(100),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // height10,
            const CircleAvatar(
              radius: 70,
              backgroundImage:
                  AssetImage("Assets/images/icons8-soccer-ball-48.png"),
            ),
            Text(
              turfName,
              textAlign: TextAlign.center,
              style: commontextStyle.copyWith(fontSize: 16),
            ),
            //height5,
            Text(
              "Kinavakkal Kut...",
              style: commontextStyle.copyWith(fontSize: 14, color: grey),
            ),
            //height5,
            Text(
              "5km",
              style: commontextStyle.copyWith(fontSize: 14, color: grey),
            ),
            // height10,
            Visibility(
              visible: visible,
              child: MaterialButtonWidget(
                height: 35,
                text: "Book",
                color: secondryColor,
                textColor: white,
                onClick: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
