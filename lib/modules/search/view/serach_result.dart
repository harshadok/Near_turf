import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:second_project/modules/home/view_model/home_page_viewmodel.dart';
import 'package:second_project/utils/res/sizedbox.dart';

const imageUrl =
    "https://www.shutterstock.com/image-photo/close-soccer-boots-on-artificial-600w-701579251.jpg";

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final homePageViewModel = context.read<HomePageProvider>();

    return Column(
      children: [
        const Text("Nearset Truf"),
        ksizedBox,
        Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 2 / 1,
                shrinkWrap: true,
                children: List.generate(20, (index) {
                  final urlImage = homePageViewModel.homeTurfList[index];
                  return SerachResultItemTile(
                    imageUrl: urlImage,
                  );
                })))
      ],
    );
  }
}

class SerachResultItemTile extends StatelessWidget {
  const SerachResultItemTile({super.key, required this.imageUrl});
  final imageUrl;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
    );
  }
}
