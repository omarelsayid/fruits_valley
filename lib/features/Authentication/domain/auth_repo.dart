import 'package:dartz/dartz.dart';

import '../../../core/failure/failures.dart';
import 'user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<Either<Failures, UserEntity>> signInWithGoogle();

  // Future<Either<Failures, UserEntity>> signInWithFacebook();
  Future addUserData({required UserEntity userEntity});

  Future saveUserData({required UserEntity userEntity});


  Future<UserEntity> getUserData({required String uId});
}
