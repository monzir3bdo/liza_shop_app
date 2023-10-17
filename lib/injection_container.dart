import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/products/data/data_sourcs/product_remote_data_source.dart';
import 'package:ecommerce/features/products/data/data_sourcs/products_local_data_source.dart';
import 'package:ecommerce/features/products/data/repository/products_repository_%20impl.dart';
import 'package:ecommerce/features/products/domain/repository/products.dart';
import 'package:ecommerce/features/products/domain/usecases/add_product.dart';
import 'package:ecommerce/features/products/domain/usecases/delete_product.dart';
import 'package:ecommerce/features/products/domain/usecases/get_all_products.dart';
import 'package:ecommerce/features/products/domain/usecases/update_product.dart';
import 'package:ecommerce/features/products/presentation/bloc/products/bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Features -Products
  //Bloc
  sl.registerFactory(
    () => ProductsBloc(
      getAllProducts: sl(),
    ),
  );
  sl.registerSingleton<AuthCubit>(AuthCubit());
  //use cases
  sl.registerLazySingleton(
    () => GetAllProductsUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => AddProductUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => DeleteProductUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UpdateProductUseCase(
      repository: sl(),
    ),
  );
  //repository
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  //datasources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<ProductsLocalDataSource>(
    () => ProductsLocalDataSourceImpl(
      preferences: sl(),
    ),
  );
  //core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: sl(),
    ),
  );
  //external libraries
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(
    () => preferences,
  );
  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
  sl.registerLazySingleton(
    () => http.Client(),
  );
}
