import 'package:get/get.dart';
import 'package:product/domain/entities/product.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';

class CartController extends GetxController {
  final CartRepository repository;

  CartController(this.repository);

  final cartItems = <CartItem>[].obs;

  double get total => cartItems.fold(
    0,
        (sum, item) => sum + (item.product.price * item.quantity),
  );

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  Future<void> loadCart() async {
    final items = await repository.getCartItems();
    cartItems.value = items;
  }

  Future<void> addToCart(Product product) async {
    await repository.addToCart(product);
    await loadCart(); // refresh cart
  }

  Future<void> removeItem(String productId) async {
    await repository.removeFromCart(productId);
    await loadCart();
  }
}
