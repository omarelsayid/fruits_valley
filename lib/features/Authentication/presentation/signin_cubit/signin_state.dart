part of 'signin_cubit.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninScuccess extends SigninState {
  final UserEntity userEntity;
  SigninScuccess({required this.userEntity});
}

final class SigninFailure extends SigninState {
  final String message;
  SigninFailure({required this.message});
}
