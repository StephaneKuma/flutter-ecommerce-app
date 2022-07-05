import 'package:ecommerce/src/app/router/router.dart';
import 'package:ecommerce/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'User'),
      bottomNavigationBar: CustomBottomAppBar(
        route: HomeRoute.name,
      ),
    );
  }
}
