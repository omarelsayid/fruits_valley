// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:fruits_valley/core/entity/prodcut_entity.dart';
import 'package:fruits_valley/core/failure/failures.dart';
import 'package:fruits_valley/core/models/product_model.dart';
import 'package:fruits_valley/core/repos/product_repo/product_repo.dart';
import 'package:fruits_valley/core/services/data_base_service.dart';
import 'package:fruits_valley/core/utils/backend_end_points.dart';

class ProductsRepoImplentation extends ProductsRepo {
  final DataBaseService dataBaseService;

  ProductsRepoImplentation(this.dataBaseService);
  @override
  Future<Either<Failures, List<ProductEntity>>> getAllProducts() async {
    try {
      var data = await dataBaseService.getData(path: BackendEndPoints.products)
          as List<Map<String, dynamic>>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntities =
          products.map((e) => e.toEnity()).toList();
      return right(productEntities);
    } catch (e) {
      return left(ServerFailuer(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await dataBaseService.getData(
          path: BackendEndPoints.products,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntities =
          products.map((e) => e.toEnity()).toList();
      return right(productEntities);
    } catch (e) {
      return left(ServerFailuer(message: e.toString()));
    }
  }
}
