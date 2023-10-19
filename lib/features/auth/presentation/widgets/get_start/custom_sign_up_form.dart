import 'package:ecommerce/core/functions/custom_toast.dart';
import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';

import 'package:ecommerce/features/auth/presentation/widgets/get_start/auth_form_field.dart';
import 'package:ecommerce/features/auth/presentation/widgets/get_start/remember_me_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../cubit/auth_cubit.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customToast('Account created..Please Verify your email')
              : customReplacmentNavigation(context, '/login');
        }

        if (state is AuthLoadingState) {
          LoadingWidget();
        } else if (state is AuthFailureState) {
          customToast(state.message);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: authCubit.signUpKey,
            child: Column(
              children: [
                AuthFormField(
                  name: 'UserName',
                  onChanged: (username) {
                    authCubit.userName = username;
                  },
                ),
                AuthFormField(
                  suffixWidget: IconButton(
                    onPressed: authCubit.obscurePasswordText,
                    icon: authCubit.obscureText
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  obscureText: authCubit.obscureText,
                  name: 'Password',
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                ),
                AuthFormField(
                  name: 'Email Address',
                  onChanged: (email) {
                    authCubit.emailAddress = email;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                const RememberMeWidget(),
                const SizedBox(
                  height: 100,
                ),
                state is AuthLoadingState
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        onPressed: () {
                          if (authCubit.signUpKey.currentState!.validate()) {
                            if (authCubit.createUserWithEmailAndPassword()) {}
                          }
                        },
                        height: 67,
                        width: 364,
                        buttonText: 'Sign Up',
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
