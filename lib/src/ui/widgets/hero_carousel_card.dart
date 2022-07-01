import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/src/app/router/router.dart';
import 'package:ecommerce/src/models/models.dart';
import 'package:flutter/material.dart';

class HeroCarouselCard extends StatelessWidget {
  const HeroCarouselCard({
    Key? key,
    this.category,
    this.product,
  }) : super(key: key);

  final Category? category;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product == null) {
          AutoRouter.of(context).push(CatalogRoute(category: category!));
        } else {
          AutoRouter.of(context).push(ProductRoute(product: product!));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 20.0,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: Stack(
            children: <Widget>[
              Image.network(
                product == null ? category!.picture : product!.picture,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Text(
                    product == null ? category!.name : product!.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
