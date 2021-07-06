import 'dart:convert';
import 'package:big_app/models/catalog.dart';
import 'package:big_app/widgets/dairy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class SearchResult extends StatefulWidget {
  String value;
  SearchResult({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<SearchResult> createState() => _SearchResultState(value);
}

class _SearchResultState extends State<SearchResult> {
  String value;

  _SearchResultState(this.value);

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            value.text.make(),
            //widget.value.text.make(),
            Dairy(),
          ],
        ),
      ),
    );
  }
}
