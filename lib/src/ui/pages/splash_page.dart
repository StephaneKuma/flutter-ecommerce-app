import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/src/app/router/router.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => AutoRouter.of(context).push(
        const HomeRoute(),
      ),
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Center(
            child: Image(
              image: AssetImage('assets/images/logo.scg'),
              width: 125.0,
              height: 125.0,
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Text(
              'STK Shop',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
