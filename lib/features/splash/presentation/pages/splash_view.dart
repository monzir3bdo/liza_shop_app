import 'package:ecommerce/core/functions/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce/injection_container.dart' as di;
import '../../../../core/database/cache/cache_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isOnboardingVisisted =
      di.sl<CacheHelper>().getData(key: 'isOnboardingVisited') ?? false;
  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      if (isOnboardingVisisted) {
        FirebaseAuth.instance.currentUser == null
            ? customReplacmentNavigation(context, '/get')
            : customReplacmentNavigation(context, '/products');
      } else {
        customNavigate(context, '/onboarding');
      }
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
