import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/modules/splash/view_model/spash_screen.dart';

class Spalsh extends StatefulWidget {
  const Spalsh({Key? key}) : super(key: key);

  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  Widget build(BuildContext context) {
    final spalsh = context.read<SplashPov>();
    return const Scaffold(
      body: Center(
        child: Text("SPLASH SCREEN"),
      ),
    );
  }
}
