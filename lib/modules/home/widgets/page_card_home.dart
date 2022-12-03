import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:second_project/utils/res/colors.dart';
import 'package:second_project/utils/res/text.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      // color: Colors.black54,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int position) {
            return homepagecard(position);
          }),
    );
  }

  homepagecard(int postion) {
    return Stack(children: [
      Container(
        height: 200,
        margin: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://images.pexels.com/photos/274422/pexels-photo-274422.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")),
          borderRadius: BorderRadius.circular(30),
          color: Colors.amber,
        ),
      ),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            margin: const EdgeInsets.only(left: 70, right: 70, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: textfromfiledColor),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hill Side",
                    style: TextStyle(
                        fontFamily: commontextStyle.fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3.5,
                        itemSize: 12,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          size: 2,
                          color: Color.fromARGB(255, 144, 142, 135),
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(width: 25),
                      const Text("4.5"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.location_on,
                        size: 15,
                      ),
                      Text("1.2 KM"),
                      SizedBox(width: 30),
                      Icon(
                        Icons.timer,
                        size: 15,
                      ),
                      Text(" 9 AM - 9 PM")
                    ],
                  )
                ],
              ),
            ),
          )),
    ]);
  }
}
