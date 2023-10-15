import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductsLocalDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<Unit> cachedProducts(List<ProductModel> products);
}

const String CACHED_PRODUCTS = 'CACHED_Products';

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  final SharedPreferences preferences;
  ProductsLocalDataSourceImpl({required this.preferences});
  @override
  Future<Unit> cachedProducts(List<ProductModel> products) {
    final List productsToJson = products
        .map<Map<String, dynamic>>((productModel) => productModel.toJson())
        .toList();
    preferences.setString(
      CACHED_PRODUCTS,
      jsonEncode(
        productsToJson,
      ),
    );
    return Future.value(unit);
  }

  @override
  Future<List<ProductModel>> getCachedProducts() {
    final jsonString = preferences.getString(CACHED_PRODUCTS);
    if (jsonString != null) {
      final List decodedJsonData = json.decode(jsonString) as List;
      final List<ProductModel> jsonToProductModels = decodedJsonData
          .map<ProductModel>(
            (json) => ProductModel.fromJson(
              json,
            ),
          )
          .toList();
      return Future.value(jsonToProductModels);
    }
    throw EmptyCacheException();
  }
}
