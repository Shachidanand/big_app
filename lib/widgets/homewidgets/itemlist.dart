import 'package:big_app/models/catalog.dart';
import 'package:big_app/models/themes.dart';
import 'package:big_app/widgets/homewidgets/productimage.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final Item catalog;

  const ItemList({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Hero(
            tag: Key(
              catalog.id.toString(),
            ),
            child: ProductImage(
              image: catalog.image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              catalog.name,
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "रु. ${catalog.price.toString()}",
              style: const TextStyle(
                fontSize: 20.0,
                color: Color(0xfffc7b13),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
