import 'package:ecommerce/src/models/models.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: <Widget>[
          Image.network(
            product.picture,
            width: 100.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle),
              ),
              Text(
                '1',
                style: Theme.of(context).textTheme.headline5,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_circle),
              ),
            ],
          )
        ],
      ),
    );
  }
}
