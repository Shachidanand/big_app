import 'package:big_app/models/catalog.dart';
import 'package:big_app/pages/details_page.dart';
import 'package:big_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: use_key_in_widget_constructors
class Dairy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (CatalogModel.items.isNotEmpty)
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: CatalogModel.items.length,
              itemBuilder: (BuildContext context, int index) {
                final catalog = CatalogModel.items[index];
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog),
                    ),
                  ),
                  child: ItemWedget(catalog: catalog),
                );
              },
            )
          // ListView.builder(
          //     physics: const ClampingScrollPhysics(),
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemCount: CatalogModel.items.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       final catalog = CatalogModel.items[index];
          //       return InkWell(
          //         onTap: () => Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 HomeDetailPage(catalog: catalog),
          //           ),
          //         ),
          //         child: ItemWedget(catalog: catalog),
          //       );
          //     },
          //   )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    ).expand();
  }
}
