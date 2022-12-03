import 'package:flutter/material.dart';

import 'package:second_project/utils/res/colors.dart';
import 'package:second_project/utils/res/text.dart';

// ignore: camel_case_types
class loginPageButton extends StatelessWidget {
  const loginPageButton(
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
              backgroundColor: primaryColor,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            onPressed: action,
            child: Text(text,
                style: TextStyle(
                    fontFamily: commontextStyle.fontFamily,
                    color: Colors.white))),
      ),
    );
  }
}

