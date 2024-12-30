part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;

  ProductsSuccess({required this.products});
}

class ProductsLoading extends ProductsState {}

class ProductsFailer extends ProductsState {
  final String message;
  ProductsFailer(this.message);
}
