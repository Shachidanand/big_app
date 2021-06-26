import 'package:big_app/models/themes.dart';
import 'package:big_app/utils/routes.dart';
import 'package:big_app/widgets/homewidgets/add_to_cart.dart';
import 'package:big_app/widgets/search.dart';
import 'package:flutter/cupertino.dart';
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
              size: 15,
            ),
          ),
          IconButton(
            visualDensity:
                const VisualDensity(horizontal: -4.0, vertical: -4.0),
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPage),
            padding: EdgeInsets.zero,
            icon: const Icon(
              CupertinoIcons.cart_fill,
              color: Colors.white,
              size: 15,
            ),
          )
        ],
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          Row(
            children: [
              AddToCart(catalog: catalog),
              Container(
                width: context.screenWidth / 2,
                color: MyTheme.orangeColor,
                child: const Text(
                  "PROCEED TO BUY",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ).p16(),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              VxArc(
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

                      (catalog.discount > 0)
                          ? Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "रु. ${catalog.price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: MyTheme.orangeColor,
                                    ),
                                  ),
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: " रु. ${catalog.mrp}",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20.0,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " ${catalog.discount} % Off",
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ).px12()
                          : Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "रु. ${catalog.price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: MyTheme.orangeColor,
                                    ),
                                  ),
                                ],
                              ),
                            ).px12(),
                      ///////////////////// item name
                      catalog.name.text.xl.capitalize.make().p16(),
                      ///////// sizedbox
                      SizedBox(
                        height: 10,
                        child: Container(
                          color: MyTheme.backColor,
                        ),
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: context.screenWidth,
                        child: "Discription : \n\n${catalog.desc}"
                            .text
                            .xl
                            .color(MyTheme.blackColor)
                            .make(),
                      ).p16(),
                      const SizedBox(height: 10),
                      Container(
                        height: 300,
                        width: context.screenWidth,
                        color: Colors.red,
                        child: "Related Product"
                            .text
                            .lg
                            .color(Colors.white)
                            .make(),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 300,
                        width: context.screenWidth,
                        color: Colors.red,
                        child:
                            "Recent Views".text.lg.color(Colors.white).make(),
                      ),
                    ],
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
