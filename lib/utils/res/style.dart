import 'package:flutter/material.dart';
import 'package:second_project/utils/res/colors.dart';

final boxDecoration = BoxDecoration(
  color: primaryColor,
  borderRadius: BorderRadius.circular(30),
);
final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.all(15),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
);
OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(60),
    );
