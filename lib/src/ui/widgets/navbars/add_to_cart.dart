import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/src/app/router/router.dart';
import 'package:ecommerce/src/models/models.dart';
import 'package:ecommerce/src/services/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartNavBar extends StatelessWidget {
  const AddToCartNavBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.share, color: Colors.white),
          onPressed: () {},
        ),
        BlocBuilder<WishListBloc, WishListState>(
          builder: (context, state) {
            if (state is WishListLoading) {
              return const CircularProgressIndicator();
            }
            if (state is WishListLoaded) {
              return IconButton(
                icon: const Icon(Icons.favorite, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to your Wishlist!'),
                    ),
                  );
                  context
                      .read<WishListBloc>()
                      .add(AddProductToWishList(product: product));
                },
              );
            }
            return const Center(child: Text('Something went wrong!'));
          },
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const CircularProgressIndicator();
            }
            if (state is CartLoaded) {
              return ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(AddProduct(product: product));
                  SnackBar snackBar =
                      const SnackBar(content: Text('Added to your cart'));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  AutoRouter.of(context).push(const CartRoute());
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(),
                ),
                child: Text(
                  'ADD TO CART',
                  style: Theme.of(context).textTheme.headline3,
                ),
              );
            }
            return const Center(child: Text('Something went wrong!'));
          },
        ),
      ],
    );
  }
}
