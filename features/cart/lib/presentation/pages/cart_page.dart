
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final CartController c = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Obx(() => ListView.builder(
        itemCount: c.cartItems.length,
        itemBuilder: (_, i) {
          final item = c.cartItems[i];
          return ListTile(
            leading: item.product.imageUrl.isEmpty
                ? const Icon(Icons.image)
                : Image.network(item.product.imageUrl, width: 56),
            title: Text(item.product.name),
            subtitle: Text(
                '${item.quantity} x \$${item.product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () => c.removeItem(item.product.id),
            ),
          );
        },
      )),
      bottomNavigationBar: Obx(() => Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Text(
          'Total: \$${c.total.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
