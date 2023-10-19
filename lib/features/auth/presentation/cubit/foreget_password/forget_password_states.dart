import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';

class ForgetPasswordLoadingState extends AuthState {}

class ForgetPasswordSuccessState extends AuthState {}

class ForgetPasswordFailureState extends AuthState {
  final String message;

  ForgetPasswordFailureState({required this.message});
}
