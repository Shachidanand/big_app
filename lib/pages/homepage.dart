import 'dart:convert';

import 'package:big_app/core/store.dart';
import 'package:big_app/models/cart.dart';
import 'package:big_app/models/catalog.dart';
import 'package:big_app/models/themes.dart';
import 'package:big_app/utils/routes.dart';
import 'package:big_app/widgets/bakery.dart';
import 'package:big_app/widgets/homewidgets/bottombar.dart';
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
    await Future.delayed(const Duration(seconds: 1));
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
      bottomNavigationBar: const MyBottomBar(),
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
