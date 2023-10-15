import 'package:ecommerce/features/products/domain/entity/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json["price"],
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      //'price': price,
      'description': description,
      'image': image,
      'category': category,
    };
  }

  double checkDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else {
      return value;
    }
  }
}
