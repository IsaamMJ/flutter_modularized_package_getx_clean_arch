import 'package:get/get.dart';
import '../../controller/product_controller.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/usecases/add_product_usecase.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl()); // ✅ bind as abstract type
    Get.lazyPut(() => GetProductsUseCase(Get.find()));
    Get.lazyPut(() => AddProductUseCase(Get.find()));
    Get.lazyPut(() => ProductController(Get.find(), Get.find()));
  }
}
