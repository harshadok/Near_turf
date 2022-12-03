import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/modules/home/widgets/shimmer_home.dart';
import 'package:second_project/modules/home_page_fullview/view_model/homepagefullview_viewmodel.dart';
import 'package:second_project/rotes/routes.dart';
import 'package:second_project/rotes/routes.dart';
import 'package:second_project/rotes/routes.dart';
import 'package:second_project/utils/app_layouts.dart';
import 'package:second_project/utils/res/sizedbox.dart';
import 'package:second_project/utils/res/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../rotes/routes.dart';
import '../../home_page_fullview/view/home_page_fullview.dart';
import '../view_model/home_page_viewmodel.dart';

class NerabyGroundCard extends StatelessWidget {
  const NerabyGroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayoute.getsize(context);
    final homePageViewModel = context.watch<HomePageProvider>();
    return Column(
      children: [
        homePageViewModel.isLoading
            ? loadingShimmer()
            : CarouselSlider.builder(
                itemCount: homePageViewModel.homeTurfList.length,
                itemBuilder: ((context, index, realIndex) {
                  final urlImage = homePageViewModel.homeTurfList[index];
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SizedBox(
                      // height: size.height * 0.2,
                      width: size.width,
                      child: InkWell(
                        onTap: () {
                          Routes.push(
                              screen: Fullpageview(
                            data: urlImage,
                          ));
                        },
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width * 13,
                                height: size.height * 0.18,
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: NetworkImage(urlImage
                                            .turfImages!.turfImages1
                                            .toString()))),
                              ),
                              ksizedBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    urlImage.turfName.toString(),
                                    style: commontextStyle,
                                  ),
                                  const Spacer(),
                                  Text(
                                    urlImage.turfPlace.toString(),
                                    style: TextStyle(
                                        fontFamily: commontextStyle.fontFamily),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  urlImage.turfCategory!.turfCricket!
                                      ? const Icon(
                                          Icons.food_bank_outlined,
                                          size: 8,
                                        )
                                      : const SizedBox(
                                          width: 10,
                                        ),
                                  const Spacer(),
                                  urlImage.turfType!.turfSevens!
                                      ? const Icon(
                                          Icons.food_bank_outlined,
                                          size: 8,
                                        )
                                      : const SizedBox(
                                          width: 10,
                                        ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                options: CarouselOptions(
                  //height: size.height * 0.20,
                  // autoPlay: true,
                  // reverse: false,
                  //aspectRatio: 1 / 5,
                  autoPlayCurve: Curves.bounceIn,
                  viewportFraction: 0.8,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    homePageViewModel.cardChangedstableIndex(index);
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
            activeIndex: value.activeindexstable,
            count: value.homeTurfList.length);
      },
    );
  }
}
