import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/widgets/get_start/auth_form_field.dart';
import 'package:ecommerce/features/auth/presentation/widgets/get_start/remember_me_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../products/presentation/pages/products_page.dart';
import 'forget_password_widget.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Form(
            key: BlocProvider.of<AuthCubit>(context).logInKey,
            child: Column(children: [
              AuthFormField(
                name: 'UserName',
                onChanged: (username) {
                  BlocProvider.of<AuthCubit>(context).userName = username;
                },
              ),
              AuthFormField(
                name: 'Password',
                onChanged: (password) {
                  BlocProvider.of<AuthCubit>(context).password = password;
                },
              ),
              const SizedBox(
                height: 28,
              ),
              const ForgetPasswordWidget(text: 'ForgetPassword?'),
              const RememberMeWidget(),
              const SizedBox(
                height: 140,
              ),
              CustomButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context)
                      .signInWithEmailAndPassword();
                  customReplacmentNavigation(context, '/products');
                },
                height: 75,
                width: double.infinity,
                buttonText: 'Sign In',
              )
            ]));
      },
    );
  }
}
