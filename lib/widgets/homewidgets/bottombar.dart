import 'package:big_app/models/themes.dart';
import 'package:big_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        buttonPadding: EdgeInsets.zero,
        children: [
          InkWell(
            onTap: () {},
            child: Icon(
              CupertinoIcons.list_bullet,
              color: MyTheme.orangeColor,
              size: 30,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.profilePage);
            },
            child: Icon(
              CupertinoIcons.person_alt_circle,
              color: MyTheme.orangeColor,
              size: 30,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              CupertinoIcons.chat_bubble_2,
              color: MyTheme.orangeColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
