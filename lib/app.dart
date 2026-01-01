import 'package:flutter/material.dart';
import 'package:xshop/features/auth/presentation/view.dart';

import './theme/theme.dart';

class XShopApp extends StatelessWidget {
  const XShopApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Shop',
      theme: darkTheme,
      home: AuthScreen(),
    );
  }
}
