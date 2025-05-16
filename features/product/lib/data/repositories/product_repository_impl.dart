import 'package:hive/hive.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  static const _boxName = 'productsBox';

  Future<Box<ProductModel>> _openBox() async =>
      await Hive.openBox<ProductModel>(_boxName);

  @override
  Future<List<Product>> getProducts() async {
    final box = await _openBox();
    return box.values.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> addProduct(Product product) async {
    final box = await _openBox();
    await box.put(product.id, ProductModel.fromEntity(product));
  }
}
