import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'User'),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
