import '../repos/product_repo/product_repo.dart';
import '../repos/product_repo/products_repo_implentation.dart';
import 'data_base_service.dart';
import 'firestore_service.dart';
import 'firebase_auth_service.dart';
import '../../features/Authentication/data/repo_impl/auht_repo_impl.dart';
import '../../features/Authentication/domain/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Register DataBaseService before using it
  getIt.registerSingleton<DataBaseService>(FirestoreService());

  // Register FirebaseAuthService
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  // Now register AuthRepo with dependencies
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthService: getIt<FirebaseAuthService>(),
    dataBaseService: getIt<DataBaseService>(),
  ));

  getIt.registerSingleton<ProductsRepo>(ProductsRepoImplentation(
    getIt<DataBaseService>(),
  ));
}
