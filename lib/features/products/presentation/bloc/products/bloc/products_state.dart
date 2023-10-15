part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<Product> products;
  const ProductsLoadedState({required this.products});
  @override
  List<Object> get props => [products];
}

class ProductsErrorState extends ProductsState {
  final String message;
  const ProductsErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
