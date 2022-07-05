import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/src/app/router/router.dart';
import 'package:flutter/material.dart';

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).push(const CheckoutRoute());
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: const RoundedRectangleBorder(),
          ),
          child: Text(
            'GO TO CHECKOUT',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ],
    );
  }
}
