import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/strings/failures_strings.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entity/product.dart';
import '../../../../domain/usecases/get_all_products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProductsUseCase getAllProducts;
  ProductsBloc({required this.getAllProducts}) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetAllProductsEvent) {
        emit(ProductsLoadingState());
        final failureOrPosts = await getAllProducts();
        emit(
          _mapFailureOrProductsToState(
            failureOrPosts,
          ),
        );
      } else if (event is RefreshProductsEvent) {
        final failureOrPosts = await getAllProducts();
        emit(
          _mapFailureOrProductsToState(
            failureOrPosts,
          ),
        );
      }
    });
  }
  ProductsState _mapFailureOrProductsToState(
      Either<Failure, List<Product>> either) {
    return either.fold(
      (failure) => ProductsErrorState(
        message: _mapFailureToMessage(
          failure,
        ),
      ),
      (products) => ProductsLoadedState(
        products: products,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case EmptyCacheFailure:
        return EMPTY_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error...Please Try again later';
    }
  }
}
