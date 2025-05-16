import 'package:cart/presentation/bindings/cart_binding.dart';
import 'package:cart/presentation/pages/cart_page.dart';
import 'package:get/get.dart';
import 'package:auth/presentation/bindings/auth_binding.dart';
import 'package:auth/presentation/pages/login_page.dart';
import 'package:home/presentation/bindings/home_binding.dart';
import 'package:home/presentation/pages/home_page.dart';
import 'package:core/routes/app_routes.dart';
import 'package:product/presentation/bindings/product_binding.dart';
import 'package:product/presentation/pages/product_list_page.dart';

import '../../presentation/pages/main_page.dart'; // ✅ Import AppRoutes from core

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/products',
      page: () => ProductListPage(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      bindings: [
        HomeBinding(),
        ProductBinding(),
        CartBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => CartPage(),
      binding: CartBinding(),
    ),


  ];
}
