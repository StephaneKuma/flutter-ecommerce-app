import 'package:ecommerce/src/services/blocs/category/category_bloc.dart';
import 'package:ecommerce/src/services/blocs/product/product_bloc.dart';
import 'package:ecommerce/src/services/blocs/wish_list/wish_list_bloc.dart';
import 'package:ecommerce/src/services/repositories/repositories.dart';
import 'package:ecommerce/src/ui/helpers/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app/router/router.dart';
import 'src/services/blocs/cart/cart_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishListBloc()..add(StartWishList())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(
          create: (_) => CategoryBloc(repository: CategoryRepository())
            ..add(
              LoadCategories(),
            ),
        ),
        BlocProvider(
          create: (_) => ProductBloc(repository: ProductRepository())
            ..add(
              LoadProducts(),
            ),
        ),
      ],
      child: MaterialApp.router(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
