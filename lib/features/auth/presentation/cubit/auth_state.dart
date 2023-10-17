part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthFailureState extends AuthState {
  final String message;
  AuthFailureState({required this.message});
}
