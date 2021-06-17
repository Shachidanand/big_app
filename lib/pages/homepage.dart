import 'dart:convert';

import 'package:big_app/models/catalog.dart';
import 'package:big_app/widgets/bakery.dart';
import 'package:big_app/widgets/dairy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  Widget build(BuildContext context) {
    // final dumyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
                "https://bigmart.com.np/images/BIGMART-BIG-BUDHABAR-OFFER_MAIN.jpg"),
            // Container(
            //   color: Colors.amber,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 16.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 "Bakery",
            //                 style: TextStyle(
            //                   fontSize: 18.0,
            //                   fontWeight: FontWeight.bold,
            //                   color: Colors.white,
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () {
            //                   print("Bakery");
            //                 },
            //                 child: Text(
            //                   "View All",
            //                   style: TextStyle(
            //                     fontSize: 18.0,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.white,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         SizedBox(
            //           height: 250.0,
            //           child: ListView.builder(
            //             physics: const ClampingScrollPhysics(),
            //             shrinkWrap: true,
            //             scrollDirection: Axis.horizontal,
            //             itemCount: CatalogModel.items.length,
            //             itemBuilder: (BuildContext context, int index) =>
            //                 ItemWidget(item: CatalogModel.items[index]),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Bakery(),
            const SizedBox(
              height: 5,
            ),
            Dairy(),
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
      // body: SingleChildScrollView(
      //         child: Column(
      //     children: [
      //       Container(
      //         child: Image.network(
      //             "https://bigmart.com.np/images/BIGMART-BIG-BUDHABAR-OFFER_MAIN.jpg"),
      //       ),
      //       Container(
      //         child: ListView.builder(
      //           itemCount: CatalogModel.items.length,
      //           itemBuilder: (context, index) {
      //             return ItemWidget(item: CatalogModel.items[index]);
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
