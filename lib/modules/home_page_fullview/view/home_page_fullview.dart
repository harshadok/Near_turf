import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:second_project/modules/home_page_fullview/view_model/homepagefullview_viewmodel.dart';
import 'package:second_project/modules/home_page_fullview/view_model/map_viewmodel.dart';
import 'package:second_project/modules/home_page_fullview/widgets/bootm_shteer.dart';
import 'package:second_project/modules/home_page_fullview/widgets/fecilities.dart';
import 'package:second_project/modules/home_page_fullview/widgets/widgets.dart';
import 'package:second_project/rotes/routes.dart';
import 'package:second_project/utils/res/sizedbox.dart';
import 'package:second_project/utils/res/text.dart';

import '../../../utils/common_widgets/elevatted_button.dart';
import '../../home/model/home_turf_model.dart';

class Fullpageview extends StatelessWidget {
  final Datum data;
  const Fullpageview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Maplounch = context.watch<mapLounch>();

    final fullpageViewModel = context.watch<fullpageViewmodel>();
    fullpageViewModel.id = data.id;
    fullpageViewModel.data = data;

    log(" turf id :${fullpageViewModel.id}");
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: size.height * 0.365,
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.3,
                          width: size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    data.turfImages!.turfImages3.toString(),
                                  ),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Routes.backPop();
                                        },
                                        icon: const Icon(Icons.arrow_back)),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const FaIcon(
                                            FontAwesomeIcons.heart)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const FaIcon(
                                            FontAwesomeIcons.share))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 195,
                    left: 150,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(data.turfLogo.toString()),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                data.turfName.toString(),
                style: TextStyle(
                    fontFamily: commontextStyle.fontFamily, fontSize: 20),
              ),
              ksizedBox,
              Text(
                data.turfPlace.toString(),
                style: TextStyle(
                  fontFamily: smallTextStyle.fontFamily,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "3 team are booked recently",
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: commontextStyle.fontFamily,
                ),
              ),
              ksizedBox,
              ksizedBox,
              ksizedBox,
              loginPageButton(
                action: () async {
                  await fullpageViewModel.fetchDetails();
                  fullpageViewModel.addingtoList();
                  // ignore: use_build_context_synchronously
                  bottomSheet(context);
                },
                width: size.width * 0.8,
                text: 'Book Now',
                hight: size.height * 1,
              ),
              ksizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CommonButtonWight(
                    action: () {},
                    hight: size.height * 0.8,
                    text: "Pricing",
                    width: size.width * .5,
                  ),
                  CommonButtonWight(
                    action: () {
                      Maplounch.mapgetting(data.turfInfo!.turfMap.toString());
                    },
                    hight: size.height * 0.8,
                    text: "Location",
                    width: size.width * .5,
                  )
                ],
              ),
              ksizedBox,
              const Divider(
                color: Colors.grey,
                height: 5.5,
              ),
              ksizedBox,
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "facilities",
                    style: commontextStyle,
                  ),
                ],
              ),
              ksizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  data.turfAmenities!.turfCafeteria == true
                      ? FecilitiesContiner(
                          icon: ("Assets/images/icons8-cafeteria-64.png"),
                          text: "Cafete",
                        )
                      : data.turfAmenities!.turfParking == true
                          ? FecilitiesContiner(
                              icon:
                                  ("Assets/images/icons8-valet-parking-50.png"),
                              text: "Parking",
                            )
                          : const SizedBox()
                ],
              ),
              ksizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FecilitiesContiner(
                    icon: ("Assets/images/icons8-dressing-50.png"),
                    text: "Shower",
                  ),
                  FecilitiesContiner(
                    icon: ("Assets/images/icons8-bathroom-32.png"),
                    text: "Washroom",
                  ),
                ],
              ),
              ksizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FecilitiesContiner(
                    icon: ("Assets/images/icons8-drinking-30.png"),
                    text: "Water",
                  ),
                  FecilitiesContiner(
                    icon: ("Assets/images/icons8-drinking-30.png"),
                    text: "Water",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
