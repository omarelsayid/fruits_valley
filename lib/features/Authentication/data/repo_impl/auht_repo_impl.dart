import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../constants.dart';
import '../../../../core/services/data_base_service.dart';
import '../../../../core/services/shared_preferences_singleton.dart';
import '../../../../core/utils/backend_end_points.dart';
import '../../../../core/failure/failures.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/auth_repo.dart';
import '../../domain/user_entity.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;
  AuthRepoImpl(
      {required this.firebaseAuthService, required this.dataBaseService});

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      log('Starting to create user...');
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);

      if (user == null) {
        log('User creation failed.');
        return left(ServerFailuer(message: 'User creation failed.'));
      }

      // Convert the Firebase User to your custom UserModel
      UserEntity userEntity =
          UserEntity(email: email, uId: user.uid, name: name);
      log('User created successfully: ${user.email}');
      addUserData(userEntity: userEntity);
      return right(
        userEntity,
      );
    } on FirebaseAuthException catch (e) {
      await deleteUser(user);
      log('CustomException: ${e.message}');
      return left(ServerFailuer(message: e.message.toString()));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      log('Starting to sign in user...');
      final User? user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);

      if (user == null) {
        log('User sign in failed.');
        return left(ServerFailuer(message: 'User sign in failed.'));
      }

      // Convert the Firebase User to your custom UserModel

      log('User signed in successfully: ${user.email}');
      UserEntity userEntity = await getUserData(uId: user.uid);
      await saveUserData(userEntity: userEntity);
      return right(userEntity);
    } on FirebaseAuthException catch (e) {
      log('CustomException: ${e.message}');
      return left(ServerFailuer(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      log('Starting to sign in user...');
      final user = await firebaseAuthService.signInWithGoogle();

      // Convert the Firebase User to your custom UserModel
      log('User signed in successfully: ${user.email}');
      UserEntity userEntity = UserModel.fromFirebaseUser(user);

      var isUserExist = await dataBaseService.checkIfDataExists(
          path: BackendEndPoints.isUserExist, docuementId: user.uid);

      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(userEntity: userEntity);
      }

      return right(userEntity);
    } on FirebaseAuthException catch (e) {
      log('CustomException: ${e.message}');
      await deleteUser(user);
      return left(ServerFailuer(message: e.message.toString()));
    }
  }

  @override
  Future addUserData({required UserEntity userEntity}) async {
    await dataBaseService.addData(
      path: BackendEndPoints.addUsersData,
      data: UserModel.fromUserEntity(userEntity).toMap(),
      doucumentId: userEntity.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await dataBaseService.getData(
        path: BackendEndPoints.addUsersData, docId: uId);

    return UserModel.fromMap(userData);
  }

  @override
  Future saveUserData({required UserEntity userEntity}) async {
    var userData = jsonEncode(UserModel.fromUserEntity(userEntity).toMap());

    await Prefs.setString(kUserData, userData);
  }

  // @override
  // Future<Either<Failures, UserEntity>> signInWithFacebook() async {
  //   try {
  //     log('Starting to sign in user...');
  //     final User? user = await firebaseAuthService.signInWithFacebook();

  //     if (user == null) {
  //       log('User sign in failed.');
  //       return left(ServerFailuer(message: 'User sign in failed.'));
  //     }

  //     // Convert the Firebase User to your custom UserModel
  //     log('User signed in successfully: ${user.email}');
  //     return right(UserModel.fromFirebaseUser(user));
  //   } on FirebaseAuthException catch (e) {
  //     log('CustomException: ${e.message}');
  //     return left(ServerFailuer(message: e.message.toString()));
  //   }
  // }
}
