import 'package:hive/hive.dart';
import '../../domain/entities/product.dart';

part 'product_model.g.dart'; // generated file

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0) String id;
  @HiveField(1) String name;
  @HiveField(2) double price;
  @HiveField(3) String description;
  @HiveField(4) String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  factory ProductModel.fromEntity(Product p) => ProductModel(
    id: p.id,
    name: p.name,
    price: p.price,
    description: p.description,
    imageUrl: p.imageUrl,
  );

  Product toEntity() => Product(
    id: id,
    name: name,
    price: price,
    description: description,
    imageUrl: imageUrl,
  );
}
