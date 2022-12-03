import 'package:flutter/material.dart';

final snackBarr = SnackBar(
  content: Text('Plese Select Your Data'),
  duration: const Duration(seconds: 10),
  action: SnackBarAction(
    label: 'Click',
    onPressed: () {
      print('Action is clicked');
    },
    textColor: Colors.white,
    disabledTextColor: Colors.grey,
  ),
  onVisible: () {
    print('Snackbar is visible');
  },
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10))),
  behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.all(30.0),
  padding: EdgeInsets.all(15.0),
);
snakBar() {
  return SnackBar(
    content: Text('Plese Select Your Data'),
    duration: const Duration(seconds: 10),
    action: SnackBarAction(
      label: 'Click',
      onPressed: () {
        print('Action is clicked');
      },
      textColor: Colors.white,
      disabledTextColor: Colors.grey,
    ),
    onVisible: () {
      print('Snackbar is visible');
    },
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(30.0),
    padding: EdgeInsets.all(15.0),
  );
}
