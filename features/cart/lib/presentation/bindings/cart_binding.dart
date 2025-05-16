import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../data/repositories/cart_repository_impl.dart';
import '../../domain/repositories/cart_repository.dart';
class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartRepository>(() => CartRepositoryImpl());
    Get.lazyPut(() => CartController(Get.find()));
  }
}
