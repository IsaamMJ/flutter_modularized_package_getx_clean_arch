import 'package:cart/data/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart'; // ✅ use hive_flutter
import 'package:core/routes/app_routes.dart';
import 'package:product/data/models/product_model.dart'; // ✅ check: 'products' not 'product'
import 'core/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ required before Hive
  await Hive.initFlutter(); // ✅ must await init
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(CartItemModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecom App',
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
    );
  }
}
