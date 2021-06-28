import 'package:big_app/core/store.dart';
import 'package:big_app/models/cart.dart';
import 'package:big_app/models/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final catalog;
  const AddToCart({
    Key? key,
    this.catalog,
  }) : super(key: key);

//   @override
//   State<AddToCart> createState() => _AddToCartState();
// }

// class _AddToCartState extends State<AddToCart> {
  // final _cart = CartModal();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModal _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog);
    return InkWell(
      onTap: () {
        if (!isInCart) {
          // isInCart = isInCart.toggle();
          // final _catalog = CatalogModel();
          // _cart.catalog = _catalog;
          // _cart.add(catalog);
          AddMutation(catalog);
          // setState(() {});
        }
      },
      child: Container(
        width: context.screenWidth / 2,
        color: MyTheme.blueColor,
        child: isInCart
            ? const Text(
                "ITEM IS IN CART",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ).p16()
            : const Text(
                "ADD TO CART",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ).p16(),
      ),
    );
  }
}
