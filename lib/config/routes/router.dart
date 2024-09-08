import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/features/auth/view/forgot_password_screen.dart';
import 'package:stylish_ecommerce_app/features/auth/view/sign_in_screen.dart';
import 'package:stylish_ecommerce_app/features/auth/view/sign_up_screen.dart';

import 'package:stylish_ecommerce_app/features/onboarding/view/screens/getting_started_screen.dart';

import 'package:stylish_ecommerce_app/features/profile/view/profile_screen.dart';

import 'package:stylish_ecommerce_app/features/splash/splash_screen.dart';


import '../../features/onboarding/view/screens/onboarding_screen.dart';

class AppRouter {
  static const String initialRoute = AppRoutes.splash;
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case AppRoutes.gettingStarted:
        return MaterialPageRoute(
          builder: (context) => const GettingStartedScreen(),
        );
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
        case AppRoutes.signIn:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      default:
        return null;
    }
  }
}
