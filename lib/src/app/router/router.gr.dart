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
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    CatalogRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CatalogPage());
    },
    WishListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const WishListPage());
    },
    CartRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CartPage());
    },
    UserRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UserPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(CatalogRoute.name, path: '/catalog-page'),
        RouteConfig(WishListRoute.name, path: '/wish-list-page'),
        RouteConfig(CartRoute.name, path: '/cart-page'),
        RouteConfig(UserRoute.name, path: '/user-page')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [CatalogPage]
class CatalogRoute extends PageRouteInfo<void> {
  const CatalogRoute() : super(CatalogRoute.name, path: '/catalog-page');

  static const String name = 'CatalogRoute';
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
/// [UserPage]
class UserRoute extends PageRouteInfo<void> {
  const UserRoute() : super(UserRoute.name, path: '/user-page');

  static const String name = 'UserRoute';
}
