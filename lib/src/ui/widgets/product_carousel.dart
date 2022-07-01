import 'package:ecommerce/src/models/models.dart';
import 'package:ecommerce/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: ProductCard(product: products[index]),
          ),
        ),
      ),
    );
  }
}
