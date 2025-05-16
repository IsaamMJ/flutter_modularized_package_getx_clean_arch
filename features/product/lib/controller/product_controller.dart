import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/usecases/add_product_usecase.dart';
import 'package:uuid/uuid.dart';

import '../data/models/product_model.dart';

class ProductController extends GetxController {
  final GetProductsUseCase getProducts;
  final AddProductUseCase addProduct;

  ProductController(this.getProducts, this.addProduct);

  final products = <Product>[].obs;
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> deleteProduct(String id) async {
    final box = await Hive.openBox<ProductModel>('productsBox');
    await box.delete(id);
    products.removeWhere((p) => p.id == id);
  }


  Future<void> fetchProducts() async {
    loading.value = true;
    products.value = await getProducts();
    loading.value = false;
  }

  Future<void> createProduct({
    required String name,
    required double price,
    required String description,
    required String imageUrl,
  }) async {
    final newProd = Product(
      id: const Uuid().v4(),
      name: name,
      price: price,
      description: description,
      imageUrl: imageUrl,
    );
    await addProduct(newProd);
    products.add(newProd); // reactive list updates UI
  }
}
