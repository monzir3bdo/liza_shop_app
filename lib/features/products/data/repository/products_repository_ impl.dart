import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';

import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';

import 'package:ecommerce/features/products/domain/entity/product.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repository/products.dart';
import '../data_sourcs/product_remote_data_source.dart';
import '../data_sourcs/products_local_data_source.dart';

typedef AddOrDeleteOrUpdate = Future<Unit> Function();

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  ProductsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final products = await remoteDataSource.getAllProducts();
        localDataSource.cachedProducts(products);
        return Right(products);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addProduct(Product product) async {
    final ProductModel productModel = ProductModel(
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      category: product.category,
      image: product.image,
    );
    return await _getMessage(
      () => remoteDataSource.addProduct(
        productModel,
      ),
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(int productId) async {
    return await _getMessage(
      () => remoteDataSource.deleteProduct(
        productId,
      ),
    );
  }

  @override
  Future<Either<Failure, Unit>> updateProduct(Product product) async {
    final productModel = ProductModel(
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      category: product.category,
      image: product.image,
    );
    return await _getMessage(
      () => remoteDataSource.updateProduct(
        productModel,
      ),
    );
  }

  Future<Either<Failure, Unit>> _getMessage(
      AddOrDeleteOrUpdate addOrDeleteOrUpdate) async {
    if (await networkInfo.isConnected) {
      try {
        await addOrDeleteOrUpdate;
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
