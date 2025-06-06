import 'package:product/domain/entities/product.dart';

import '../entities/cart_item.dart';

abstract class CartRepository {
  Future<void> addToCart(Product product);
  Future<List<CartItem>> getCartItems();
  Future<void> removeFromCart(String productId);
}
