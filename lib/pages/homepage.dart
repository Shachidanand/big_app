import 'dart:convert';

import 'package:big_app/models/catalog.dart';
import 'package:big_app/widgets/bakery.dart';
import 'package:big_app/widgets/topdivision.dart';
import 'package:flutter/cupertino.dart';
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
        elevation: 0.0,
        title: Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: dataSearch(),
                );
              },
              child: Container(
                  height: 45.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.search),
                        const SizedBox(width: 10),
                        const Text("Search Product, Brans and More"),
                      ],
                    ),
                  )),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell_fill,
              color: Colors.white,
              size: 15,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.cart_fill,
              color: Colors.white,
              size: 15,
            ),
          )
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
            Image.network(
                "https://bigmart.com.np/images/BIGMART-BIG-BUDHABAR-OFFER_MAIN.jpg"),
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

// ignore: camel_case_types
class dataSearch extends SearchDelegate<String> {
  final productsList = [
    "Brade",
    "Wai Wai",
    "Apple",
    "Banana",
    "Tamato",
    "CauliFlower",
  ];
  final recentList = [
    "Brade",
    "Apple",
    "Banana",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.red,
        child: Center(child: Text(query)),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggesationList = query.isEmpty
        ? recentList
        : productsList
            .where(
              (p) => p.toLowerCase().startsWith(
                    query.toLowerCase(),
                  ),
            )
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          leading: const Icon(Icons.watch_later_outlined),
          title: RichText(
            text: TextSpan(
              text: suggesationList[index].substring(0, query.length),
              style: const TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggesationList[index].substring(query.length),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )),
      itemCount: suggesationList.length,
    );
  }
}
