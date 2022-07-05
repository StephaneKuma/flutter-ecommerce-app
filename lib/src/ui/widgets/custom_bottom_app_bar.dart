import 'package:ecommerce/src/app/router/router.dart';
import 'package:ecommerce/src/models/models.dart';
import 'package:ecommerce/src/ui/widgets/navbars/navbars.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
    required this.route,
    this.product,
  }) : super(key: key);

  final String route;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      child: SizedBox(
        height: 60.0,
        child: (route == ProductRoute.name)
            ? AddToCartNavBar(product: product!)
            : (route == CartRoute.name)
                ? const GoToCheckoutNavBar()
                : (route == CheckoutRoute.name)
                    ? const OrderNowNavBar()
                    : const HomeNavBar(),
      ),
    );
  }
}
