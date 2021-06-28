import 'package:big_app/core/store.dart';
import 'package:big_app/models/cart.dart';
import 'package:big_app/models/themes.dart';
import 'package:big_app/utils/routes.dart';
import 'package:big_app/widgets/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: use_key_in_widget_constructors
class MyAppBar extends StatelessWidget {
  final _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),
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
              onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPage),
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
    );
  }
}
