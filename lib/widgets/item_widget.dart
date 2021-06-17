import 'package:big_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item catalog;

  const ItemWidget({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   leading: Image.network(item.image),
    //   title: Text(item.name),
    // );
    return Card(
      child: Column(
        children: [
          Image.network(
            catalog.image,
            height: 170,
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
