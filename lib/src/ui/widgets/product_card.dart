import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/src/app/router/router.dart';
import 'package:ecommerce/src/models/models.dart';
import 'package:ecommerce/src/services/blocs/cart/cart_bloc.dart';
import 'package:ecommerce/src/services/blocs/wish_list/wish_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5.0,
    this.isWishList = false,
  }) : super(key: key);

  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(ProductRoute(product: product));
      },
      child: Stack(
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
            left: leftPosition,
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
            left: leftPosition + 5.0,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor -
                  10 -
                  leftPosition,
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
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }

                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(AddProduct(product: product));

                                SnackBar snackBar = const SnackBar(
                                  content: Text('Added to your cart'),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: const Icon(
                                Icons.add_shopping_cart_outlined,
                                color: Colors.white,
                              ),
                            ),
                          );
                        } else {
                          return const Center(
                            child: Text('Something went wrong'),
                          );
                        }
                      },
                    ),
                    if (isWishList)
                      Expanded(
                        child: BlocBuilder<WishListBloc, WishListState>(
                          builder: (context, state) {
                            return IconButton(
                              onPressed: () {
                                context.read<WishListBloc>().add(
                                    RemoveProductFromWishList(
                                        product: product));

                                SnackBar snackBar = const SnackBar(
                                  content: Text('Removed from your wish list'),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
