import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/products/domain/entity/product.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, Unit>> deleteProduct(int productId);
  Future<Either<Failure, Unit>> addProduct(Product product);
  Future<Either<Failure, Unit>> updateProduct(Product product);
}
