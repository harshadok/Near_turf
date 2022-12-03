import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/utils/res/colors.dart';
import 'package:second_project/utils/res/sizedbox.dart';
import 'package:second_project/utils/res/text.dart';

import '../../view_model/introduction_screen_provider.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;
    return Consumer<IntroductionScreenProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: hight * .7,
                    ),
                    Text(
                      "Delever to Home ",
                      style: commonHeddingtextStyle,
                    ),
                    ksizedBox,
                    const Text(
                      "To get your food, Our delivery executives delivers \n at your door step.",
                    ),
                    ksizedBox,
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: (() {
                          value.addToShared();
                        }),
                        child: Text("Get Start",
                            style: TextStyle(
                                fontFamily: commontextStyle.fontFamily,
                                color: Colors.white))),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
