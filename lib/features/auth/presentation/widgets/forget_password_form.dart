import 'package:ecommerce/core/functions/custom_toast.dart';
import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/cubit/foreget_password/forget_password_states.dart';
import 'package:ecommerce/features/auth/presentation/widgets/get_start/auth_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
      return Form(
        key: authCubit.forgetKey,
        child: Column(
          children: [
            AuthFormField(
              name: 'Email',
              onChanged: (email) {
                authCubit.emailAddress = email;
              },
            ),
            const SizedBox(
              height: 106,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0),
              child: Text(
                'Please write your email to receive a confirmation code to set a new password.',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            state is ForgetPasswordLoadingState
                ? const CircularProgressIndicator()
                : CustomButton(
                    onPressed: () {
                      authCubit.resetPassword();
                    },
                    buttonText: 'Confirm Mail',
                    height: 67,
                    width: 367,
                  ),
          ],
        ),
      );
    }, listener: (context, state) {
      if (state is ForgetPasswordSuccessState) {
        customToast('check your email');
        customReplacmentNavigation(context, '/login');
      } else if (state is ForgetPasswordFailureState) {
        customToast(state.message);
      }
    });
  }
}
