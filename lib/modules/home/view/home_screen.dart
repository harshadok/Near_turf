import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/modules/home/view_model/home_page_viewmodel.dart';
import 'package:second_project/modules/home/widgets/nearby_card.dart';
import 'package:second_project/modules/home/widgets/offfer_viewcard.dart';
import 'package:second_project/modules/search_screen/view/search_screen.dart';
import 'package:second_project/rotes/routes.dart';
import 'package:second_project/utils/res/colors.dart';
import 'package:second_project/utils/res/sizedbox.dart';
import 'package:second_project/utils/res/text.dart';
import 'package:second_project/modules/home/widgets/page_card_home.dart';

import '../widgets/tuft_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    // double hight = MediaQuery.of(context).size.height;
    final homePageViewModel = context.read<HomePageProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    homePageViewModel.currentLocation ?? "",
                    style: commontextStyle,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        size: 30,
                      ))
                ],
              ),
              Row(
                children: [
                  Text(homePageViewModel.currentDistrict ?? ""),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: textfromfiledColor,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.5))
                      ],
                      borderRadius: BorderRadius.circular(30)),
                  height: 35,
                  child: TextFormField(
                    onTap: () {
                      Routes.push(screen: SearchView());
                    },
                    decoration: InputDecoration(
                        hintText: "Nearst Turf",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 10.0),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: primaryColor,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.white, width: .1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: .1, color: Colors.white),
                            borderRadius: BorderRadius.circular(30))),
                  )),
              const SizedBox(
                height: 10,
              ),
              const HomePageCard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TurfTypeCard(
                    text: "Fivies",
                  ),
                  TurfTypeCard(
                    text: "Sixs",
                  ),
                  TurfTypeCard(
                    text: "Sevens",
                  ),
                  TurfTypeCard(
                    text: "Elevens",
                  ),
                ],
              ),
              ksizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nearby Grounds",
                    style: commontextStyle,
                  ),
                  InkWell(
                    onTap: () {
                      log("you clicked view all");
                    },
                    child: Text(
                      "View All",
                      style: smalltextstyle,
                    ),
                  )
                ],
              ),
              ksizedBox,
              const NerabyGroundCard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Matches around you",
                    style: commontextStyle,
                  ),
                  InkWell(
                    onTap: () {
                      log("you clicked view all");
                    },
                    child: Text(
                      "View All",
                      style: smalltextstyle,
                    ),
                  )
                ],
              ),
              ksizedBox,
              const OfferViewCard(),
              ksizedBox,
              ksizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
