import 'package:flutter/material.dart';

import 'package:online_shop/theme/theme.dart';

import 'router/router.dart';

class OnlineShopApp extends StatelessWidget {
  const OnlineShopApp({super.key});
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
        title: 'CryptoCurrenciesList',
        theme: darkTheme,
        routerConfig: appRouter.config());
  }
}
