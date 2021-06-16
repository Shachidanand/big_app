import 'package:big_app/pages/homepage.dart';
import 'package:big_app/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BigMart",
      //shome: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homePage: (context) => HomePage(),
        //MyRoutes.loginPage: (context) => LoginPage(),
      },
    );
  }
}
