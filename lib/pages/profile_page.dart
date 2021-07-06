import 'package:big_app/models/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            width: double.infinity,
            color: Colors.deepOrange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.teal,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/280x280_RS/be/b1/39/beb1395bf8bc0b4eb6289d57feea375a.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: MyTheme.blueColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                "Shachidanand Pandit"
                    .text
                    .bold
                    .color(Colors.white)
                    .xl2
                    .make()
                    .py8(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.only(top: 180),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: MyTheme.orangeShadeColor,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.location,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      "Kathmandu, Nepal".text.lg.make(),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: MyTheme.orangeShadeColor,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.phone,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      "+977-980XXXXXXX".text.lg.make(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
