import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/features/profile/view/profile_screen.dart';
import 'package:stylish_ecommerce_app/features/splash/splash_screen.dart';
import 'package:stylish_ecommerce_app/features/onboarding/onboarding_screen.dart';
import 'package:stylish_ecommerce_app/features/onboarding/getting_started_screen.dart';

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
          builder: (context) => const OnboardingScreen(),
        );
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      default:
        return null;
    }
  }
}
