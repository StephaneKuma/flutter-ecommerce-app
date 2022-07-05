import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/src/app/router/router.dart';
import 'package:flutter/material.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            AutoRouter.of(context).push(const HomeRoute());
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {
            AutoRouter.of(context).push(const CartRoute());
          },
        ),
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white),
          onPressed: () {
            AutoRouter.of(context).push(const UserRoute());
          },
        )
      ],
    );
  }
}
