import 'package:big_app/models/themes.dart';
import 'package:flutter/material.dart';
import 'package:big_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backColor,
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //////////////////////// IMAGE
              Container(
                decoration: const BoxDecoration(),
                child: Center(
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
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              //////////////// PRICE AND NAME
              Expanded(
                child: VxArc(
                  height: 0,
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /////////////// item price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            "रु. ${catalog.price}"
                                .toString()
                                .text
                                .bold
                                .xl3
                                .color(MyTheme.orangeColor)
                                .make(),
                            SizedBox(width: 10),
                            (catalog.discount > 0)
                                ? "रु. ${catalog.mrp}"
                                    .toString()
                                    .text
                                    .lineThrough
                                    .xl
                                    .color(MyTheme.blackColor)
                                    .make()
                                : "".text.make(),
                            SizedBox(width: 10),
                            (catalog.discount > 0)
                                ? "${catalog.discount} % off"
                                    .toString()
                                    .text
                                    .bold
                                    .xl
                                    .color(Colors.green)
                                    .make()
                                : "".text.make(),
                          ],
                        ).px16(),

                        ///////////////////// item name
                        catalog.name.text.xl2.capitalize.make().px16(),
                        ///////// sizedbox
                        SizedBox(
                          height: 10,
                          child: Container(
                            color: MyTheme.backColor,
                          ),
                        ),
                        Container(
                          width: context.screenWidth,
                          child: "Discription :"
                              .text
                              .xl
                              .color(MyTheme.blackColor)
                              .make(),
                        ).p16(),
                      ],
                    ).py16(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
