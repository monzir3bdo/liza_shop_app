import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/features/auth/presentation/widgets/get_start/auth_form_field.dart';
import 'package:ecommerce/features/auth/presentation/widgets/get_start/remember_me_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../products/presentation/pages/products_page.dart';
import '../../cubit/auth_cubit.dart';

class CustomAuthForm extends StatelessWidget {
  const CustomAuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
            key: BlocProvider.of<AuthCubit>(context).signUpKey,
            child: Column(
              children: [
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
                AuthFormField(
                  name: 'Email Address',
                  onChanged: (email) {
                    BlocProvider.of<AuthCubit>(context).emailAddress = email;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                const RememberMeWidget(),
                const SizedBox(
                  height: 140,
                ),
                CustomButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).signOut();
                    BlocProvider.of<AuthCubit>(context)
                        .createUserWithEmailAndPassword();
                    customNavigate(context, '/signIn');
                  },
                  height: 75,
                  width: double.infinity,
                  buttonText: 'Sign Up',
                )
              ],
            ));
      },
    );
  }
}
