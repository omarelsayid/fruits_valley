import 'package:dartz/dartz.dart';
import 'package:fruits_valley/core/entity/prodcut_entity.dart';
import 'package:fruits_valley/core/failure/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failures, List<ProductEntity>>> getAllProducts();

  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts();
}
