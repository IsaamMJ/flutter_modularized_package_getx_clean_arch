import 'package:cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final ProductController c = Get.find<ProductController>();
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Obx(() => c.loading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: c.products.length,
        itemBuilder: (_, i) {
          final p = c.products[i];
          return ListTile(
            leading: p.imageUrl.isEmpty
                ? const Icon(Icons.image)
                : Image.network(p.imageUrl, width: 56, fit: BoxFit.cover),
            title: Text(p.name),
            subtitle: Text('\$${p.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => c.deleteProduct(p.id),
                ),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () => cartController.addToCart(p),
                ),
              ],
            ),
            onTap: () => Get.snackbar(p.name, p.description),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    final nameCtrl = TextEditingController();
    final priceCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final imgCtrl = TextEditingController();

    Get.defaultDialog(
      title: 'Add Product',
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: priceCtrl,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: imgCtrl,
                decoration: const InputDecoration(labelText: 'Image URL'),
              ),
            ],
          ),
        ),
      ),
      textConfirm: 'Save',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      onConfirm: () {
        final price = double.tryParse(priceCtrl.text) ?? 0;
        if (nameCtrl.text.isEmpty || price <= 0) {
          Get.snackbar('Error', 'Name and valid price are required');
          return;
        }
        c.createProduct(
          name: nameCtrl.text,
          price: price,
          description: descCtrl.text,
          imageUrl: imgCtrl.text,
        );
        Get.back();
      },
    );
  }
}
