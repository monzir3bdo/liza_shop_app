import 'package:ecommerce/core/functions/custom_toast.dart';
import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/cubit/log_in/login_states.dart';
import 'package:ecommerce/features/auth/presentation/widgets/get_start/auth_form_field.dart';
import 'package:ecommerce/features/auth/presentation/widgets/get_start/remember_me_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'forget_password_widget.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: authCubit.logInKey,
          child: Column(children: [
            AuthFormField(
              name: 'email',
              onChanged: (email) {
                authCubit.emailAddress = email;
              },
            ),
            AuthFormField(
              name: 'Password',
              onChanged: (password) {
                authCubit.password = password;
              },
              obscureText: authCubit.obscureText,
              suffixWidget: IconButton(
                onPressed: authCubit.obscurePasswordText,
                icon: authCubit.obscureText
                    ? const Icon(Icons.visibility_rounded)
                    : const Icon(Icons.visibility_off_rounded),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            ForgetPasswordWidget(
              text: 'ForgetPassword?',
              onPressed: () {
                customNavigate(context, '/forget');
              },
            ),
            const RememberMeWidget(),
            const SizedBox(
              height: 140,
            ),
            state is LoginLoadingState
                ? const CircularProgressIndicator()
                : CustomButton(
                    onPressed: () {
                      if (authCubit.logInKey.currentState!.validate()) {
                        if (authCubit.loginWithEmailAndPassword()) {}
                      }
                    },
                    height: 67,
                    width: 364,
                    buttonText: 'Log In',
                  ),
          ]),
        ),
      ),
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            customToast('Welcome in');
            customReplacmentNavigation(context, '/products');
          } else {
            customToast('Please Verify your account');
          }
        } else if (state is LoginFailureState) {
          customToast(state.message);
        }
      },
    );
  }
}
