import 'dart:convert';

import 'package:big_app/core/store.dart';
import 'package:big_app/models/cart.dart';
import 'package:big_app/models/catalog.dart';
import 'package:big_app/models/themes.dart';
import 'package:big_app/utils/routes.dart';
import 'package:big_app/widgets/bakery.dart';
import 'package:big_app/widgets/search.dart';
import 'package:big_app/widgets/topdivision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catlogJson = await rootBundle.loadString("assets/files/catlog.json");
    final decoadedData = jsonDecode(catlogJson);
    var productsData = decoadedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  final _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    // final dumyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 0.0,
        title: Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55.0),
          child: MySearchBar(),
        ),
        actions: [
          IconButton(
            visualDensity:
                const VisualDensity(horizontal: -4.0, vertical: -4.0),
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: const Icon(
              CupertinoIcons.bell_fill,
              color: Colors.white,
              size: 25,
            ),
          ),
          VxBuilder(
            // ignore: prefer_const_literals_to_create_immutables
            mutations: {AddMutation, RemoveMutation},
            builder: (context, store, status) {
              return IconButton(
                visualDensity:
                    const VisualDensity(horizontal: -4.0, vertical: -4.0),
                onPressed: () =>
                    Navigator.pushNamed(context, MyRoutes.cartPage),
                padding: EdgeInsets.zero,
                icon: const Icon(
                  CupertinoIcons.cart_fill,
                  color: Colors.white,
                  size: 25,
                ).badge(color: MyTheme.blueColor, count: _cart.items.length),
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: DivisionsWidget(),
            ),
            // Image.network(
            //     "https://bigmart.com.np/images/BIGMART-BIG-BUDHABAR-OFFER_MAIN.jpg"),
            VxSwiper.builder(
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              itemCount: 2,
              aspectRatio: 16 / 8,
              itemBuilder: (context, index) {
                return Image.network(
                  "https://bigmart.com.np/images/BIGMART-BIG-BUDHABAR-OFFER_MAIN.jpg",
                );
              },
            ),
            Bakery(),
            const SizedBox(
              height: 5,
            ),
            //Dairy(),
            const Text(
              'Demo Headline 2',
              style: TextStyle(fontSize: 18),
            ),
            Card(
              child: ListTile(
                  title: Text('Motivation $int'),
                  subtitle:
                      const Text('this is a description of the motivation')),
            ),
          ],
        ),
      ),
    );
  }
}

// // ignore: camel_case_types
// class dataSearch extends SearchDelegate<String> {
//   final productsList = [
//     "Brade",
//     "Wai Wai",
//     "Apple",
//     "Banana",
//     "Tamato",
//     "CauliFlower",
//   ];
//   final recentList = [
//     "Brade",
//     "Apple",
//     "Banana",
//   ];

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = "";
//         },
//         icon: const Icon(Icons.clear),
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, "");
//       },
//       icon: AnimatedIcon(
//           icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // ignore: sized_box_for_whitespace
//     return Container(
//       height: 100,
//       width: 100,
//       child: Card(
//         color: Colors.red,
//         child: Center(child: Text(query)),
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggesationList = query.isEmpty
//         ? recentList
//         : productsList
//             .where(
//               (p) => p.toLowerCase().startsWith(
//                     query.toLowerCase(),
//                   ),
//             )
//             .toList();

//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//           onTap: () {
//             showResults(context);
//           },
//           leading: const Icon(Icons.watch_later_outlined),
//           title: RichText(
//             text: TextSpan(
//               text: suggesationList[index].substring(0, query.length),
//               style: const TextStyle(
//                 color: Colors.deepOrange,
//                 fontWeight: FontWeight.bold,
//               ),
//               children: [
//                 TextSpan(
//                   text: suggesationList[index].substring(query.length),
//                   style: const TextStyle(color: Colors.grey),
//                 ),
//               ],
//             ),
//           )),
//       itemCount: suggesationList.length,
//     );
//   }
// }
