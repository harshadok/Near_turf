import 'package:flutter/material.dart';
import 'package:second_project/utils/res/text.dart';

class MaterialButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double? height;
  final Function() onClick;
  const MaterialButtonWidget(
      {Key? key,
      required this.text,
      required this.color,
      required this.textColor,
      required this.onClick,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: MaterialButton(
        onPressed: onClick,
        child: Text(
          text,
          style: commontextStyle.copyWith(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
