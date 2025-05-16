import 'package:hive/hive.dart';
import 'package:product/domain/entities/product.dart';
import '../../../domain/entities/cart_item.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 1)
class CartItemModel extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late double price;

  @HiveField(3)
  late String description;

  @HiveField(4)
  late String imageUrl;

  @HiveField(5)
  late int quantity;

  CartItemModel();

  CartItemModel.fromCartItem(CartItem item) {
    id = item.product.id;
    name = item.product.name;
    price = item.product.price;
    description = item.product.description;
    imageUrl = item.product.imageUrl;
    quantity = item.quantity;
  }

  CartItem toEntity() => CartItem(
    product: Product(
      id: id,
      name: name,
      price: price,
      description: description,
      imageUrl: imageUrl,
    ),
    quantity: quantity,
  );
}
