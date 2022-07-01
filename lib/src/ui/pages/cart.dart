import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
