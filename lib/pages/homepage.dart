import 'package:big_app/models/catalog.dart';
import 'package:big_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              // ignore: avoid_unnecessary_containers
              child: Container(
                  child: Image.network(
                      "https://bigmart.com.np/images/BIGMART-BIG-BUDHABAR-OFFER_MAIN.jpg")),
            ),
            Container(
              width: 400,
              padding: const EdgeInsets.only(top: 15),
              color: Colors.deepOrange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Text(
                      "Bakery",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: ListView.builder(
                      itemCount: CatalogModel.items.length,
                      itemBuilder: (context, index) {
                        return ItemWidget(
                          item: CatalogModel.items[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
