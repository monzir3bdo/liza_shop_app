import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFailureState extends AuthState {
  final String message;
  LoginFailureState({required this.message});
}
