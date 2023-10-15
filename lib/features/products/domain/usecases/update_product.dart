import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/products/domain/entity/product.dart';
import 'package:ecommerce/features/products/domain/repository/products.dart';

class UpdateProductUseCase {
  final ProductsRepository repository;
  UpdateProductUseCase({required this.repository});
  Future<Either<Failure, Unit>> call(Product product) async {
    return await repository.updateProduct(product);
  }
}
