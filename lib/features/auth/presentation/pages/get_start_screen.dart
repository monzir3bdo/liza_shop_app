import 'package:ecommerce/core/font_style_manager.dart';
import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/auth/presentation/pages/sign_in_page.dart';
import 'package:ecommerce/features/auth/presentation/pages/log_in_page.dart';
import 'package:ecommerce/features/auth/presentation/widgets/get_start/all_social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildBody(context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Let’s Get Started',
            style: FontManager.interSemiBold28.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 180,
          ),
          const AllSocialButtons(),
          const SizedBox(
            height: 250,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have account? '),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()));
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            onPressed: () {
              customNavigate(context, '/signUp');
            },
            buttonText: 'Create an Account',
            height: 75,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
