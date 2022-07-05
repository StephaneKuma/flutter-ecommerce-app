import 'package:ecommerce/src/app/router/router.dart';
import 'package:ecommerce/src/models/models.dart';
import 'package:ecommerce/src/services/blocs/product/product_bloc.dart';
import 'package:ecommerce/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: const CustomBottomAppBar(route: CatalogRoute.name,),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state is ProductLoaded) {
            var products = state.products
                .where((Product product) => product.category == category.name)
                .toList();
            return GridView.builder(
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
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
