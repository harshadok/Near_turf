import 'package:flutter/material.dart';

import 'package:second_project/utils/res/text.dart';

// ignore: must_be_immutable
class TurfTypeCard extends StatelessWidget {
  TurfTypeCard({
    super.key,
    required this.text,
  });

  String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;
    return Card(
      elevation: 4,
      child: SizedBox(
        width: width * 0.2,
        height: hight * 0.03,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontFamily: commontextStyle.fontFamily),
          ),
        ),
      ),
    );
  }
}
