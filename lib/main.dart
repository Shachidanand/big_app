import 'package:big_app/pages/cart_page.dart';
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
      debugShowCheckedModeBanner: false,
      title: "BigMart",
      //shome: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: "/",
      routes: {
        // ignore: prefer_const_constructors
        "/": (context) => HomePage(),
        MyRoutes.homePage: (context) => HomePage(),
        MyRoutes.cartPage: (context) => const CartPage(),
        //
        //MyRoutes.loginPage: (context) => LoginPage(),
      },
    );
  }
}
