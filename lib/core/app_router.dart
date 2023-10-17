import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/pages/get_start_screen.dart';
import 'package:ecommerce/features/auth/presentation/pages/onboard_page.dart';
import 'package:ecommerce/features/auth/presentation/pages/sign_in_page.dart';
import 'package:ecommerce/features/auth/presentation/pages/log_in_page.dart';
import 'package:ecommerce/features/products/presentation/pages/home_page.dart';
import 'package:ecommerce/features/products/presentation/pages/products_page.dart';
import 'package:ecommerce/features/splash/presentation/pages/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/products/presentation/bloc/products/bloc/products_bloc.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnBoardingPage()),
    GoRoute(path: '/get', builder: (context, state) => const GetStart()),
    GoRoute(
        path: '/signUp',
        builder: (context, state) => BlocProvider(
              create: (context) => AuthCubit(),
              child: const SignUpPage(),
            )),
    GoRoute(
      path: '/signIn',
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignInPage(),
      ),
    ),
    GoRoute(path: '/getStart', builder: (context, state) => const GetStart()),
    GoRoute(
        path: '/products', builder: (context, state) => const ProductsPage()),
  ],
);
