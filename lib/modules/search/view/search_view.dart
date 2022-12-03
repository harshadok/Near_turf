import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/modules/home/view_model/home_page_viewmodel.dart';
import 'package:second_project/modules/search/view/serach_result.dart';
import 'package:second_project/utils/res/sizedbox.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final searchviewmodel = context.read<SearchViewModel>();
    final homePageViewModel = context.read<HomePageProvider>();

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // controller: searchviewmodel.serchFiled,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.grey[500],
                  suffixIcon: const Icon(Icons.close)),
            ),
          ),
          ksizedBox,
          const Expanded(child: SearchResult())
        ],
      )),
    );
  }
}
