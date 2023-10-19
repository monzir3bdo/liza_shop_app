import 'package:ecommerce/core/font_style_manager.dart';
import 'package:ecommerce/features/auth/presentation/widgets/custom_bottom_text.dart';
import 'package:ecommerce/features/auth/presentation/widgets/get_start/custom_login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          child: CustomLoginForm(),
        ),
        const SliverToBoxAdapter(
          child: CustomBottomText(
            text: "Don't have an account? ",
            textButtonName: 'Sign Up',
            destination: 'signup',
          ),
        )
      ],
    );
  }
}
