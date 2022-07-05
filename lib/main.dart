import 'package:ecommerce/src/services/blocs/blocs.dart';
import 'package:ecommerce/src/services/blocs/simple_bloc_observer.dart';
import 'package:ecommerce/src/services/repositories/repositories.dart';
import 'package:ecommerce/src/ui/helpers/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, blocObserver: SimpleBlocObserver());
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
          create: (_) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
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
