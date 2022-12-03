import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:second_project/utils/res/colors.dart';
import 'package:second_project/utils/res/sizedbox.dart';
import 'package:second_project/utils/res/text.dart';

const imageUrl =
    "https://www.shutterstock.com/image-photo/close-soccer-boots-on-artificial-600w-701579251.jpg";

class SearchIdWidget extends StatelessWidget {
  const SearchIdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Top Search",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: commontextStyle.fontFamily),
        ),
        ksizedBox,
        ksizedBox,
        Expanded( 
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) {  
                return const TopSerachTile();
              }),
              separatorBuilder: ((context, index) {
                return ksizedBox;
              }),
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSerachTile extends StatelessWidget {
  const TopSerachTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: screenWidth.width * 0.3,
          height: 100,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        const Text(
          "Turf Name",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }
}
