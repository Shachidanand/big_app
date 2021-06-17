import 'package:big_app/models/catalog.dart';
import 'package:big_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Dairy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
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
                    "Dairy",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // ignore: avoid_print
                      print("Dairy");
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
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: CatalogModel.items.length,
                itemBuilder: (BuildContext context, int index) =>
                    ItemWidget(catalog: CatalogModel.items[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
