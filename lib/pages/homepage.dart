import 'package:big_app/models/catalog.dart';
import 'package:big_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final dumyList = List.generate(20, (index) => CatalogModel.items[0]);
  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 250.0,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: dumyList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ItemWidget(item: dumyList[index]),
                ),
              ),
            ),
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
