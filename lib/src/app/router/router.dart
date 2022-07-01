import 'package:auto_route/auto_route.dart';
import 'package:ecommerce/src/models/models.dart';
import 'package:ecommerce/src/ui/pages/pages.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
  AutoRoute(page: HomePage, initial: true),
  AutoRoute(page: CatalogPage),
  AutoRoute(page: WishListPage),
  AutoRoute(page: CartPage),
  AutoRoute(page: UserPage),
])
class AppRouter extends _$AppRouter {}
