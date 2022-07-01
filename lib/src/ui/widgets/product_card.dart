import 'package:ecommerce/src/models/models.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
  }) : super(key: key);

  final Product product;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width / widthFactor,
          height: 150.0,
          child: Image.network(
            product.picture,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60.0,
          child: Container(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.blue.withAlpha(50),
            ),
          ),
        ),
        Positioned(
          top: 65.0,
          left: 5.0,
          child: Container(
            width: MediaQuery.of(context).size.width / widthFactor - 10,
            height: 70.0,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          '\$${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
