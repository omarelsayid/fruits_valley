
import 'package:bloc/bloc.dart';
import '../entity/prodcut_entity.dart';
import '../repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productsRepo) : super(ProductsInitial());
  final ProductsRepo _productsRepo;
  int productsLenght = 0;

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    final result = await _productsRepo.getAllProducts();
    result.fold((l) => emit(ProductsFailer(l.message)),
        (r) => emit(ProductsSuccess(products: r)));
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await _productsRepo.getBestSellingProducts();
    result.fold((l) {
      emit(ProductsFailer(l.message));
    }, (r) {
      productsLenght = r.length;
      emit(ProductsSuccess(products: r));
    });
  }
}
