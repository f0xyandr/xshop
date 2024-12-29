import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../features/auth/view.dart';
import '../features/cart/view/view.dart';
import '../features/categories_list/product_grid.dart';
import '../features/checkout/checkout.dart';
import '../features/home/view/home_screen.dart';
import '../features/product_add/view/view.dart';
import '../features/product_card/product_card.dart';
import '../features/product_delete/product_delete.dart';
import '../features/product_grid/product_grid.dart';
import '../features/registration/view.dart';
import '../repositories/products/models/models.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ProductRoute.page, path: '/product'),
        AutoRoute(page: AuthRoute.page, path: '/'),
        AutoRoute(page: RegistrationRoute.page, path: '/reg'),
        AutoRoute(page: ProductCardRoute.page, path: '/card'),
        AutoRoute(page: ProductCategoriesRoute.page, path: '/categories'),
        AutoRoute(page: CartRoute.page, path: '/cart'),
        AutoRoute(page: ProductAddRoute.page, path: '/add'),
        AutoRoute(page: ProductDeleteRoute.page, path: '/delete'),
        AutoRoute(page: CheckoutRoute.page, path: '/checkout'),
        AutoRoute(page: HomeRoute.page, path: '/home'),
      ];
}

// final routes = {
//   '/': (context) => const CryptoListScreen(),
//   '/coin': (context) => const CryptoCoinScreen(),
// };
