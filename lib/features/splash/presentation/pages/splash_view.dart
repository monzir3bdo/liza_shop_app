import 'package:ecommerce/features/auth/presentation/pages/onboard_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const OnBoardingPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3D93F8),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: SvgPicture.asset(
        'assets/images/splash_logo.svg',
        width: 50,
        height: 50,
      ),
    );
  }
}
