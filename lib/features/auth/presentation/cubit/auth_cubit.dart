import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/auth/presentation/cubit/log_in/login_states.dart';
import 'package:ecommerce/features/auth/presentation/cubit/password_change_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GlobalKey<FormState> signUpKey = GlobalKey();
  final GlobalKey<FormState> logInKey = GlobalKey();
  late String emailAddress;
  late String password;
  late String userName;
  bool obscureText = true;

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

  loginWithEmailAndPassword() async {
    try {
      emit(LoginLoadingState());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        emit(LoginFailureState(message: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        emit(LoginFailureState(message: 'No user found for that email.'));
      } else {
        emit(LoginFailureState(message: 'check your email and password!'));
      }
    }
  }

  void obscurePasswordText() {
    if (obscureText == true) {
      obscureText = false;
    } else {
      obscureText = true;
    }
    emit(PasswordChangeState());
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
