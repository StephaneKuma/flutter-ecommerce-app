import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/src/models/models.dart';
import 'package:ecommerce/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'STK Shop'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true,
              ),
              items: Category.demoList
                  .map<HeroCarouselCard>((Category category) =>
                      HeroCarouselCard(category: category))
                  .toList(),
            ),
            const SectionTitle(title: 'RECOMMENDED'),
            ProductCarousel(
              products: Product.demoList
                  .where((Product product) => product.isRecommended)
                  .toList(),
            ),
            const SectionTitle(title: 'MOST POPULAR'),
            ProductCarousel(
              products: Product.demoList
                  .where((Product product) => product.isPopular)
                  .toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
