import 'package:big_app/models/catalog.dart';
import 'package:big_app/pages/details_page.dart';
import 'package:big_app/widgets/homewidgets/itemlist.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Bakery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Bakery",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // ignore: avoid_print
                      print("Bakery");
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250.0,
              child: (CatalogModel.items.isNotEmpty)
                  ? ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: CatalogModel.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final catalog = CatalogModel.items[index];
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeDetailPage(catalog: catalog),
                            ),
                          ),
                          child: ItemList(catalog: catalog),
                        );
                      },
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => HomeDetailPage(
                      //             catalog: CatalogModel.items[index]),
                      //       ),
                      //     );
                      //   },
                      //   child: ItemWidget(catalog: CatalogModel.items[index]),
                      // ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
