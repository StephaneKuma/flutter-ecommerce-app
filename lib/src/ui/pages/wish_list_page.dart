import 'package:ecommerce/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Wish List'),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
