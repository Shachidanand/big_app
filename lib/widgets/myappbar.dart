import 'package:big_app/widgets/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MyAppBar extends StatelessWidget {

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
    );
  }
}
