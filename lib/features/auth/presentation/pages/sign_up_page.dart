import 'package:ecommerce/core/font_style_manager.dart';
import 'package:ecommerce/features/auth/presentation/widgets/custom_bottom_text.dart';

import 'package:flutter/material.dart';

import '../widgets/get_start/custom_sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 105,
          ),
        ),
        SliverToBoxAdapter(
          child: Align(
            child: Text(
              "Sign Up",
              style: FontManager.interSemiBold28,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: CustomSignUpForm(),
        ),
        const SliverToBoxAdapter(
          child: CustomBottomText(
            text: 'Already have an account? ',
            textButtonName: 'Login',
            destination: 'login',
          ),
        )
      ],
    );
  }
}
