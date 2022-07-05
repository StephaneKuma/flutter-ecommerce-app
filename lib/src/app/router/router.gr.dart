// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    CatalogRoute.name: (routeData) {
      final args = routeData.argsAs<CatalogRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CatalogPage(key: args.key, category: args.category));
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ProductPage(key: args.key, product: args.product));
    },
    WishListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const WishListPage());
    },
    CartRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CartPage());
    },
    CheckoutRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CheckoutPage());
    },
    OrderConfirmationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OrderConfirmationPage());
    },
    UserRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UserPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(HomeRoute.name, path: '/home-page'),
        RouteConfig(CatalogRoute.name, path: '/catalog-page'),
        RouteConfig(ProductRoute.name, path: '/product-page'),
        RouteConfig(WishListRoute.name, path: '/wish-list-page'),
        RouteConfig(CartRoute.name, path: '/cart-page'),
        RouteConfig(CheckoutRoute.name, path: '/checkout-page'),
        RouteConfig(OrderConfirmationRoute.name,
            path: '/order-confirmation-page'),
        RouteConfig(UserRoute.name, path: '/user-page')
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [CatalogPage]
class CatalogRoute extends PageRouteInfo<CatalogRouteArgs> {
  CatalogRoute({Key? key, required Category category})
      : super(CatalogRoute.name,
            path: '/catalog-page',
            args: CatalogRouteArgs(key: key, category: category));

  static const String name = 'CatalogRoute';
}

class CatalogRouteArgs {
  const CatalogRouteArgs({this.key, required this.category});

  final Key? key;

  final Category category;

  @override
  String toString() {
    return 'CatalogRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [ProductPage]
class ProductRoute extends PageRouteInfo<ProductRouteArgs> {
  ProductRoute({Key? key, required Product product})
      : super(ProductRoute.name,
            path: '/product-page',
            args: ProductRouteArgs(key: key, product: product));

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({this.key, required this.product});

  final Key? key;

  final Product product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [WishListPage]
class WishListRoute extends PageRouteInfo<void> {
  const WishListRoute() : super(WishListRoute.name, path: '/wish-list-page');

  static const String name = 'WishListRoute';
}

/// generated route for
/// [CartPage]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '/cart-page');

  static const String name = 'CartRoute';
}

/// generated route for
/// [CheckoutPage]
class CheckoutRoute extends PageRouteInfo<void> {
  const CheckoutRoute() : super(CheckoutRoute.name, path: '/checkout-page');

  static const String name = 'CheckoutRoute';
}

/// generated route for
/// [OrderConfirmationPage]
class OrderConfirmationRoute extends PageRouteInfo<void> {
  const OrderConfirmationRoute()
      : super(OrderConfirmationRoute.name, path: '/order-confirmation-page');

  static const String name = 'OrderConfirmationRoute';
}

/// generated route for
/// [UserPage]
class UserRoute extends PageRouteInfo<void> {
  const UserRoute() : super(UserRoute.name, path: '/user-page');

  static const String name = 'UserRoute';
}
