import 'package:flutter/material.dart';
import 'package:second_project/utils/res/colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.nodataMassage,
    this.controler,
    this.formkey,
  }) : super(key: key);
  final String hintText;
  final IconData icon;
  final String nodataMassage;
  final formkey;
  final controler;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 3,
                offset: const Offset(1, 1),
                color: Colors.grey.withOpacity(0.5))
          ]),
      child: Form(
        key: formkey,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return nodataMassage;
            }
            return null;
          },
          controller: controler,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon, color: primaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
