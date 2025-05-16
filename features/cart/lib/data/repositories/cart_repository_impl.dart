import 'package:hive/hive.dart';
import 'package:product/domain/entities/product.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../models/cart_item_model.dart';

class CartRepositoryImpl implements CartRepository {
  static const _boxName = 'cartBox';

  Future<Box<CartItemModel>> _openBox() async {
    return await Hive.openBox<CartItemModel>(_boxName);
  }

  @override
  Future<void> addToCart(Product product) async {
    final box = await _openBox();
    final existing = box.values.firstWhere(
          (item) => item.id == product.id,
      orElse: () => CartItemModel()..quantity = 0,
    );

    if (existing.quantity > 0) {
      existing.quantity += 1;
      await existing.save();
    } else {
      final item = CartItemModel.fromCartItem(
        CartItem(product: product, quantity: 1),
      );
      await box.put(product.id, item);
    }
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    final box = await _openBox();
    return box.values.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> removeFromCart(String productId) async {
    final box = await _openBox();
    await box.delete(productId);
  }
}
