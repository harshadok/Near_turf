import 'package:flutter/cupertino.dart';
import 'package:second_project/utils/res/colors.dart';

// ignore: must_be_immutable
class FecilitiesContiner extends StatelessWidget {
  FecilitiesContiner({super.key, required this.icon, required this.text});
  String text;
  // ignore: prefer_typing_uninitialized_variables
  final icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: black),
        borderRadius: BorderRadius.circular(10),
        color: white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          ImageIcon(AssetImage(icon)),
        ],
      ),
    );
  }
}
