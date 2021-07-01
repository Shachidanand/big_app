import 'package:big_app/pages/division_result.dart';
// ignore: unused_import
import 'package:big_app/pages/search_result.dart';
import 'package:flutter/material.dart';

class DivisionsWidget extends StatelessWidget {
  const DivisionsWidget({Key? key}) : super(key: key);

  Widget firstList(String imgVal, String text, BuildContext context) {
    return InkWell(
      onTap: () {
        // ignore: avoid_print
        //print(text);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DivisionResult(value: text),
          ),
        );
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => SearchResult(value: text)));
      },
      // ignore: sized_box_for_whitespace
      child: Container(
        width: 60,
        child: Column(
          children: [
            Card(
              elevation: 0.0,
              child: Image.asset(
                imgVal,
                height: 30,
              ),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            firstList("assets/images/offerzone.png", "Offer Zone", context),
            firstList("assets/images/baker.png", "Bakery", context),
            firstList("assets/images/dairy.png", "Dairy", context),
            firstList("assets/images/fmcgfood.png", "Food", context),
            firstList("assets/images/fmcghh.png", "H & H", context),
            firstList("assets/images/fresh.png", "Fresh", context),
            firstList("assets/images/frozen.png", "Frozen", context),
            firstList("assets/images/liq.png", "Liq & Tob", context),
          ],
        ),
      ),
    );
  }
}
