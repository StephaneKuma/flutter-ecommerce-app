import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/src/app/router/router.dart';
import 'package:ecommerce/src/services/blocs/cart/cart_bloc.dart';
import 'package:ecommerce/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart'),
      bottomNavigationBar: const CustomBottomAppBar(route: CartRoute.name),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                state.cart.freeDeliveryString,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => AutoRouter.of(context).push(
                                const HomeRoute(),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                shape: const RoundedRectangleBorder(),
                                elevation: 0,
                              ),
                              child: Text(
                                'Add More',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.cart
                                .productQuantity(state.cart.products)
                                .keys
                                .length,
                            itemBuilder: (context, index) => CartProductCard(
                              product: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .elementAt(index),
                              quantity: state.cart
                                  .productQuantity(state.cart.products)
                                  .values
                                  .elementAt(index),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: OrderSummary(),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
