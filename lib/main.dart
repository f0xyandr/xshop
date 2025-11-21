import 'package:flutter/widgets.dart';
import 'package:xshop/service_locator.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  runApp(XShopApp());
}
