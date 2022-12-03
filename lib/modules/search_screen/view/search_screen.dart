import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/modules/home/view_model/home_page_viewmodel.dart';
import 'package:second_project/modules/home_page_fullview/service/services.dart';
import 'package:second_project/rotes/routes.dart';
import 'package:second_project/utils/app_layouts.dart';
import 'package:second_project/utils/res/text.dart';
import '../../home/model/home_turf_model.dart';
import '../../home_page_fullview/view/home_page_fullview.dart';

class SearchView extends StatelessWidget {
  // static String id = "search_view";
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayoute.getsize(context);

    List<Datum> results = Provider.of<HomePageProvider>(context).homeTurfList;
    final homePageViewModel = context.watch<HomePageProvider>();
    return SafeArea(
      child: Scaffold(
        body: Consumer<HomePageProvider>(
          builder: (BuildContext context, value, _) {
            final dataList = value.homeTurfList;
            runFilter(String enteredKeyword) {
              if (enteredKeyword.isEmpty) {
                results = dataList;
              } else {
                results = dataList
                    .where((element) => element.turfName!
                        .toUpperCase()
                        .contains(enteredKeyword.toUpperCase()))
                    .toList();
              }
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            runFilter(value);
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Search turfs by name',
                              counterText: '',
                              suffixIcon: Icon(Icons.search_rounded)),
                          maxLength: 20,
                        ),
                      ),
                    ],
                  ),
                  // height20,
                  Expanded(
                    child: results.isEmpty
                        ? const Center(
                            child: Text("Search for your fvourite turfs"),
                          )
                        : GridView.builder(
                            padding: const EdgeInsets.all(12.0),
                            // crossAxisCount: 4,
                            // mainAxisSpacing: 24,
                            // crossAxisSpacing: 12,
                            itemCount: dataList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final urlImage =
                                  homePageViewModel.homeTurfList[index];

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: size.height * 0.14,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Image.network(
                                              urlImage.turfImages!.turfImages1
                                                  .toString(),
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
                                            fontFamily:
                                                commontextStyle.fontFamily),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            // staggeredTileBuilder: (int index) =>
                            //     StaggeredTile.fit(2),
                          ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
