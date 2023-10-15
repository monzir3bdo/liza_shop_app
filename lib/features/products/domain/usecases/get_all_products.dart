import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/products/domain/entity/product.dart';
import 'package:ecommerce/features/products/domain/repository/products.dart';

class GetAllProductsUseCase {
  final ProductsRepository repository;
  GetAllProductsUseCase({required this.repository});
  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllProducts();
  }
}
