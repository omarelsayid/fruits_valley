part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupScuccess extends SignupState {
  final UserEntity userEntity;

  SignupScuccess({required this.userEntity});
}

class SignupFailure extends SignupState {
  final String message;

  SignupFailure(this.message);
}
