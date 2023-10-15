import 'package:ecommerce/core/font_style_manager.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/auth/presentation/widgets/get_start/remember_me_widget.dart';
import 'package:ecommerce/features/products/presentation/pages/products_page.dart';

import 'package:flutter/material.dart';

import '../widgets/get_start/auth_form_field.dart';

import '../widgets/get_start/forget_password_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
              "Welcome",
              style: FontManager.interSemiBold28,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Align(
            child: Text(
              "Please enter your data to continue",
              style: FontManager.interRegular13.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 15,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 80,
          ),
        ),
        const SliverToBoxAdapter(
          child: AuthFormField(name: 'UserName'),
        ),
        const SliverToBoxAdapter(
          child: AuthFormField(name: 'Password'),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 28,
          ),
        ),
        const SliverToBoxAdapter(
          child: ForgetPasswordWidget(text: 'ForgetPassword?'),
        ),
        const SliverToBoxAdapter(
          child: RememberMeWidget(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 140,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductsPage(),
                ),
              );
            },
            height: 75,
            width: double.infinity,
            buttonText: 'Sign In',
          ),
        )
      ],
    );
  }
}
