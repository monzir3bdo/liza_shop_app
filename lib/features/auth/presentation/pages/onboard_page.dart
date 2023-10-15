import 'package:ecommerce/core/font_style_manager.dart';

import 'package:ecommerce/features/auth/presentation/pages/get_start_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3D93F8),
      body: _buildBody(),
      bottomSheet: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        height: 400,
        width: 400,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Look Good, Feel Good',
              style: FontManager.interSemiBold28.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Create your individual & unique style and look amazing everyday.',
              textAlign: TextAlign.center,
              style: FontManager.interRegular13.copyWith(
                fontSize: 19,
                fontWeight: FontWeight.w100,
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GetStart()));
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/images/onboarding.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
