import 'package:big_app/models/cart.dart';
import 'package:big_app/models/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          Row(
            children: [
              Container(
                width: context.screenWidth / 2,
                color: Colors.white,
                child: _CartTotal(),
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: "Buying Not Supported Yet".text.make(),
                    ),
                  );
                },
                child: Container(
                  width: context.screenWidth / 2,
                  color: MyTheme.orangeColor,
                  child: const Text(
                    "PROCEED TO PAY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ).p16(),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          const _CartList().p16().expand(),
          const Divider(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModal();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: context.screenWidth / 2,
      child: "Total : रु. ${_cart.totalPrice}/-"
          .text
          .xl2
          .bold
          .color(Colors.green)
          .make()
          .p16()
          .px16(),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModal();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? Card(child: "Nothing To Show".text.xl.makeCentered())
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                leading: Image.network(_cart.items[index].image),
                trailing: IconButton(
                  onPressed: () {
                    _cart.remove(_cart.items[index]);
                    setState(() {});
                  },
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _cart.items[index].name.text.make(),
                    "रु. ${_cart.items[index].price}".text.make(),
                  ],
                ),
              ).py8(),
            ),
          );
  }
}
