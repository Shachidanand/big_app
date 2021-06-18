import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: 170,
    );
  }
}