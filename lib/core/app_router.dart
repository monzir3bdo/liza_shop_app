import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/pages/forget_password_page.dart';
import 'package:ecommerce/features/auth/presentation/pages/get_start_screen.dart';
import 'package:ecommerce/features/auth/presentation/pages/onboard_page.dart';
import 'package:ecommerce/features/auth/presentation/pages/log_in_page.dart';
import 'package:ecommerce/features/auth/presentation/pages/sign_up_page.dart';
import 'package:ecommerce/features/products/presentation/pages/products_page.dart';
import 'package:ecommerce/features/splash/presentation/pages/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
      path: '/login',
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const LoginPage(),
      ),
    ),
    GoRoute(
        path: '/products', builder: (context, state) => const ProductsPage()),
    GoRoute(
      path: '/forget',
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const ForgetPasswordPage(),
      ),
    )
  ],
);
