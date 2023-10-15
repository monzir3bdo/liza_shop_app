import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/products/domain/repository/products.dart';

class DeleteProductUseCase {
  final ProductsRepository repository;
  DeleteProductUseCase({required this.repository});
  Future<Either<Failure, Unit>> call(int productId) {
    return repository.deleteProduct(productId);
  }
}
