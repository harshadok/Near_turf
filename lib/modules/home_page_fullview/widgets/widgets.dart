import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_project/utils/res/text.dart';

class TimingWidget extends StatelessWidget {
  final String title;
  final String price;
  const TimingWidget({
    Key? key, required this.title, required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text(price),
      ],
    );
  }
}
class CommonButtonWight extends StatelessWidget {
  const CommonButtonWight(
      {Key? key,
      required this.width,
      required this.hight,
      required this.text,
      required this.action})
      : super(key: key);
  final double width;
  final double hight;
  final String text;
  final Function() action;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width * .75,
        height: hight * 0.052,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(width: 0.2, color: Colors.black),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            onPressed: action,
            child: Text(text,
                style: TextStyle(
                    fontFamily: commontextStyle.fontFamily,
                    color: Colors.black))),
      ),
    );
  }
}
