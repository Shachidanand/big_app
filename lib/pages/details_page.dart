import 'package:flutter/material.dart';
import 'package:big_app/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Hero(
                  tag: Key(
                    catalog.id.toString(),
                  ),
                  child: Image.network(
                    catalog.image,
                    width: 300.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text(catalog.name),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
