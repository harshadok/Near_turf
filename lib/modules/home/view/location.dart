import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:second_project/utils/common_widgets/elevatted_button.dart';
import 'package:second_project/utils/res/sizedbox.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: hight * 0.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: hight * 0.40,
                width: width * 0.6,
                child: Lottie.asset(
                  'Assets/26623-map-navigation.json',
                  repeat: true,
                  reverse: true,
                  animate: true,
                ),
              ),
            ],
          ),
          ksizedBox,
          ksizedBox,
          ksizedBox,
          ksizedBox,
          loginPageButton(
            action: () {

              
            },
            hight: hight,
            text: 'Access Location',
            width: width,
          )
        ],
      )),
    );
  }
}
