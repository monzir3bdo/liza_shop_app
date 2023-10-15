import 'package:ecommerce/core/font_style_manager.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/auth/presentation/widgets/get_start/remember_me_widget.dart';

import 'package:flutter/material.dart';

import '../../../products/presentation/pages/products_page.dart';
import '../widgets/get_start/auth_form_field.dart';

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
          child: AuthFormField(name: 'UserName'),
        ),
        const SliverToBoxAdapter(
          child: AuthFormField(name: 'Password'),
        ),
        const SliverToBoxAdapter(
          child: AuthFormField(name: 'Email Address'),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
          ),
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
            buttonText: 'Sign Up',
          ),
        )
      ],
    );
  }
}
