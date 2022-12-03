import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:second_project/utils/res/colors.dart';

import 'package:second_project/modules/settings/view/setting_page.dart';

import '../../home/view/home_screen.dart';
import '../../home/view_model/home_page_viewmodel.dart';
import '../../order/view/order_screen.dart';

class BottomNavigationPage extends StatelessWidget {
  BottomNavigationPage({Key? key}) : super(key: key);
  final page = [
    const OrderScreen(),
    const HomeScreen(),
    // const CartScreen(),
    const SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (BuildContext context, home, Widget? _) {
        return Scaffold(
            body: page[home.curentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: home.curentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: primaryColor,
              onTap: (newValue) {
                home.bottomChange(newValue);
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.meetup),
                  label: 'MeetUp',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house),
                  label: 'Home',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.category_outlined),
                //   label: 'Category',
                // ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.football),
                  label: 'Profile',
                ),
              ],
            ));
      },
    );
  }
}
