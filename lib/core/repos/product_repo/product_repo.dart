import 'package:dartz/dartz.dart';
import '../../entity/prodcut_entity.dart';
import '../../failure/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failures, List<ProductEntity>>> getAllProducts();

  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts();
}
