import 'package:big_app/pages/search_result.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          showSearch(
            context: context,
            delegate: dataSearch(),
          );
        },
        child: Container(
          height: 45.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 10),
                const Text("Search Product, Brands and More"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class dataSearch extends SearchDelegate<String> {
  final productsList = [
    "Brade",
    "Wai Wai",
    "Apple",
    "Banana",
    "Tamato",
    "CauliFlower",
  ];
  final recentList = [
    "Brade",
    "Apple",
    "Banana",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return SearchResult(
      value: query,
    );
    // Container(
    //   height: 100,
    //   width: 100,
    //   child: Card(
    //     color: Colors.red,
    //     child: Center(
    //       child: Text(query),
    //     ),
    //   ),
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggesationList = query.isEmpty
        ? recentList
        : productsList
            .where(
              (p) => p.toLowerCase().startsWith(
                    query.toLowerCase(),
                  ),
            )
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          leading: const Icon(Icons.watch_later_outlined),
          title: RichText(
            text: TextSpan(
              text: suggesationList[index].substring(0, query.length),
              style: const TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggesationList[index].substring(query.length),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )),
      itemCount: suggesationList.length,
    );
  }
}
