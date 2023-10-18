import 'package:ecommerce/core/database/cache/cache_helper.dart';
import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/onboarding_man.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Welcome To our Store',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w500,
                fontFamily: 'Abel-Regular',
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            const SizedBox(
              height: 19,
            ),
            const Text(
              'Get What you want in one application',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 41,
            ),
            CustomButton(
                onPressed: () {
                  CacheHelper()
                      .saveData(key: 'isOnboardingVisited', value: true);
                  customNavigate(context, '/get');
                },
                buttonText: "Get Started",
                height: 67,
                width: 350),
            const SizedBox(
              height: 87,
            )
          ],
        ),
      ),
    );
  }
}
