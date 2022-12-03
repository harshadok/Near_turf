import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/modules/home/widgets/shimmer_home.dart';
import 'package:second_project/modules/home_page_fullview/view/home_page_fullview.dart';
import 'package:second_project/rotes/routes.dart';
import 'package:second_project/utils/app_layouts.dart';
import 'package:second_project/utils/res/sizedbox.dart';
import 'package:second_project/utils/res/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../view_model/home_page_viewmodel.dart';

class OfferViewCard extends StatelessWidget {
  const OfferViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayoute.getsize(context);
    final homePageViewModel = context.watch<HomePageProvider>();
    return Column(
      children: [
        homePageViewModel.isLoading == true
            ? loadingShimmer()
            : CarouselSlider.builder(
                itemCount: homePageViewModel.homeTurfList.length,
                itemBuilder: ((context, index, realIndex) {
                  final urlImage = homePageViewModel.homeTurfList[index];

                  return InkWell(
                    onTap: () {
                      Routes.push(
                          screen: Fullpageview(
                        data: urlImage,
                      ));
                    },
                    child: Card(
                      margin: const EdgeInsets.only(right: 10),
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.14,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.network(
                                  urlImage.turfImages!.turfImages1.toString(),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Text(
                            urlImage.turfName.toString(),
                            style: commontextStyle,
                          ),
                          Text(
                            urlImage.turfPlace.toString(),
                            style: TextStyle(
                                fontFamily: commontextStyle.fontFamily),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                options: CarouselOptions(
                  viewportFraction: 0.4,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    homePageViewModel.HomePageCardAuto(index);
                  },
                ),
              ),
        ksizedBox,
        ksizedBox,
        buildIndicater()
      ],
    );
  }

  Widget buildimage(String urlImage, int index) {
    return Column(children: [
      Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
      ksizedBox,
      const Text("Derby County")
    ]);
  }

  buildIndicater() {
    return Consumer<HomePageProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return AnimatedSmoothIndicator(
            effect: const JumpingDotEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Colors.green,
                dotColor: Colors.black12),
            activeIndex: value.activeindex,
            count: value.homeTurfList.length);
      },
    );
  }
}
