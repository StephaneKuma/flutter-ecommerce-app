import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/src/models/models.dart';
import 'package:ecommerce/src/services/blocs/category/category_bloc.dart';
import 'package:ecommerce/src/services/blocs/product/product_bloc.dart';
import 'package:ecommerce/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'STK Shop'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {}

                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      autoPlay: true,
                    ),
                    items: state.categories
                        .map<HeroCarouselCard>((Category category) =>
                            HeroCarouselCard(category: category))
                        .toList(),
                  );
                } else {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
              },
            ),
            const SectionTitle(title: 'RECOMMENDED'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((Product product) => product.isRecommended)
                        .toList(),
                  );
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              },
            ),
            const SectionTitle(title: 'MOST POPULAR'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((Product product) => product.isPopular)
                        .toList(),
                  );
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
