import 'package:ecommerce/src/models/models.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final List<Product> products = Product.demoList
        .where((Product product) => product.category == category.name)
        .toList();

    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.15,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) => Center(
          child: ProductCard(
            product: products[index],
            widthFactor: 2.2,
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
