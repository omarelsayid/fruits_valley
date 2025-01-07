import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/auth_repo.dart';
import '../../domain/user_entity.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());
    try {
      final result =
          await authRepo.createUserWithEmailAndPassword(email, password, name);
      result.fold(
        (failure) => emit(SignupFailure(failure.message)),
        (userEntity) => emit(SignupScuccess(userEntity: userEntity)),
      );
    } catch (e) {
      emit(SignupFailure('مشكلة في عملية التسجيل: ${e.toString()}'));
    }
  }
}
