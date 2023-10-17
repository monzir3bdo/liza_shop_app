import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/auth/presentation/cubit/log_in/login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final signUpKey = GlobalKey();
  final logInKey = GlobalKey();
  late String emailAddress;
  late String password;
  late String userName;

  AuthCubit() : super(AuthInitial());
  createUserWithEmailAndPassword() async {
    try {
      emit(AuthLoadingState());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          AuthFailureState(message: 'The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailureState(
            message: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
  }

  signInWithEmailAndPassword() async {
    try {
      emit(LoginLoadingState());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailureState(message: e.message.toString()));
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
