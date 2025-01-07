import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/auth_repo.dart';
import '../../domain/user_entity.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SigninLoading());
    try {
      final result = await authRepo.signInWithEmailAndPassword(email, password);
      result.fold(
        (failure) => emit(SigninFailure(message: failure.message)),
        (userEntity) => emit(SigninScuccess(userEntity: userEntity)),
      );
    } catch (e) {
      emit(SigninFailure(
          message: ' لقد حدث خطأ في تسجيل الدخول   : ${e.toString()}'));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    try {
      final result = await authRepo.signInWithGoogle();
      result.fold(
        (failure) => emit(SigninFailure(message: failure.message)),
        (userEntity) => emit(SigninScuccess(userEntity: userEntity)),
      );
    } catch (e) {
      emit(SigninFailure(
          message: ' لقد حدث خطأ في تسجيل الدخول   : ${e.toString()}'));
    }
  }

  // Future<void> signInWithFacebook() async {
  //   emit(SigninLoading());
  //   try {
  //     final result = await authRepo.signInWithFacebook();
  //     result.fold(
  //       (failure) => emit(SigninFailure(message: failure.message)),
  //       (userEntity) => emit(SigninScuccess(userEntity: userEntity)),
  //     );
  //   } catch (e) {
  //     emit(SigninFailure(
  //         message: ' لقد حدث خطأ في تسجيل الدخول   : ${e.toString()}'));
  //   }
  // }
}
