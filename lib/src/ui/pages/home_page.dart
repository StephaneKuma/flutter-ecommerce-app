import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/src/models/models.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'STK Shop'),
      body: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.5,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        items: Category.demoList
            .map<HeroCarouselCard>(
                (Category category) => HeroCarouselCard(category: category))
            .toList(),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
