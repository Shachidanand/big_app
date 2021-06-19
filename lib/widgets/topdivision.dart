import 'package:flutter/material.dart';

class DivisionsWidget extends StatelessWidget {
  const DivisionsWidget({Key? key}) : super(key: key);
  Widget firstList(String imgVal, String text) {
    return InkWell(
      onTap: () {
        // ignore: avoid_print
        print(text);
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
            firstList("assets/images/offerzone.png", "Offer Zone"),
            firstList("assets/images/baker.png", "Bakery"),
            firstList("assets/images/dairy.png", "Dairy"),
            firstList("assets/images/fmcgfood.png", "Food"),
            firstList("assets/images/fmcghh.png", "H & H"),
            firstList("assets/images/fresh.png", "Fresh"),
            firstList("assets/images/frozen.png", "Frozen"),
            firstList("assets/images/liq.png", "Liq & Tob"),
          ],
        ),
      ),
    );
  }
}
