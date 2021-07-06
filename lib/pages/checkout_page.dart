import 'package:big_app/core/store.dart';
import 'package:big_app/models/cart.dart';
import 'package:big_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckOutPage extends StatelessWidget {
  final CartModal _cart = (VxState.store as MyStore).cart;
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
          alignment: MainAxisAlignment.center,
          buttonPadding: EdgeInsets.zero,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: MaterialButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: "Your Order Has Been Confirmed".text.make(),
                      ),
                    );
                    Navigator.pushNamed(context, MyRoutes.homePage);
                  },
                  height: 50,
                  minWidth: 350.0,
                  color: const Color(0xfffc7b13),
                  child: "Confirm Buy".text.lg.bold.color(Colors.white).make()),
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 240,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Total Item :".text.xl3.bold.make(),
                            " ${_cart.items.length}".text.xl3.bold.make(),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Total Price :".text.xl3.bold.make(),
                            "रु. ${_cart.totalPrice}/-"
                                .text
                                .xl3
                                .bold
                                .color(Colors.green)
                                .make(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Discount :".text.xl3.bold.make(),
                            "रु. ${_cart.totalDiscount}/-"
                                .text
                                .xl3
                                .color(Colors.green)
                                .bold
                                .make(),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Net Payable:".text.xl3.bold.make(),
                            "रु. ${_cart.totalPrice - _cart.totalDiscount}/-"
                                .text
                                .xl3
                                .color(Colors.green)
                                .bold
                                .make(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Card(
                child: "Payment Method : COD".text.xl.bold.make().p8(),
              ),
            ),
          ],
        ));
  }
}
