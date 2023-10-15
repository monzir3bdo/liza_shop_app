import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';

import '../../domain/entity/product.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<Unit> deleteProduct(int productId);
  Future<Unit> addProduct(Product product);
  Future<Unit> updateProduct(Product product);
}

const String BASE_URL = 'https://fakestoreapi.com';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get(
      Uri.parse(
        '$BASE_URL/products',
      ),
    );
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body) as List;
      final productModels = decodedJson
          .map<ProductModel>(
            (jsonProductModel) => ProductModel.fromJson(
              jsonProductModel,
            ),
          )
          .toList();
      return productModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addProduct(Product product) async {
    final body = {
      'title': product.title,
      //'price': product.price,
      'description': product.description,
      'image': product.image,
      'category': product.category,
    };
    final response =
        await http.post(Uri.parse('$BASE_URL/products/'), body: body);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteProduct(int productId) async {
    final response = await http.delete(
      Uri.parse(
        '$BASE_URL/products/$productId',
      ),
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateProduct(Product product) async {
    final body = {
      'title': product.title,
      // 'price': product.price,
      'description': product.description,
      'image': product.image,
      'category': product.category,
    };
    final int productId = product.id!;
    final response = await http.put(
      Uri.parse('$BASE_URL/products/$productId'),
      body: body,
    );
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
