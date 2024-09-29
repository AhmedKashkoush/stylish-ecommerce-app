import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/core/widgets/bottom_bar_wrapper/bottom_bar_wrapper.dart';
import 'package:stylish_ecommerce_app/features/auth/view/screens/forgot_password_screen.dart';
import 'package:stylish_ecommerce_app/features/auth/view/screens/sign_in_screen.dart';
import 'package:stylish_ecommerce_app/features/auth/view/screens/sign_up_screen.dart';
import 'package:stylish_ecommerce_app/features/cart/view/screens/cart_screen.dart';

import 'package:stylish_ecommerce_app/features/onboarding/view/screens/getting_started_screen.dart';
import 'package:stylish_ecommerce_app/features/payment/view/screens/checkout_screen.dart';

import 'package:stylish_ecommerce_app/features/profile/view/screens/profile_screen.dart';
import 'package:stylish_ecommerce_app/features/search/view/screens/search_screen.dart';

import 'package:stylish_ecommerce_app/features/splash/splash_screen.dart';

import '../../features/onboarding/view/screens/onboarding_screen.dart';

class AppRouter {
  static const String initialRoute = AppRoutes.checkout;
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
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => const BottomBarWrapper(),
        );
      case AppRoutes.profile:
        return _slideTransition(
          const ProfileScreen(),
          transitionType: _PageTransitionType.endToStart,
        );
      case AppRoutes.search:
        return _slideTransition(
          const SearchScreen(),
          transitionType: _PageTransitionType.bottomToTop,
        );
      case AppRoutes.cart:
        return _slideTransition(
          const CartScreen(),
          transitionType: _PageTransitionType.bottomToTop,
        );
      case AppRoutes.checkout:
        return _slideTransition(const CheckoutScreen(), transitionType: _PageTransitionType.bottomToTop);

      default:
        return null;
    }
  }

  static PageRouteBuilder _slideTransition(
    Widget page, {
    required _PageTransitionType transitionType,
  }) {
    return PageRouteBuilder(
      transitionsBuilder: (context, animation, __, child) {
        late final Offset offset;
        final bool isRtl = Directionality.of(context) == TextDirection.rtl;
        switch (transitionType) {
          case _PageTransitionType.startToEnd:
            offset = Offset(isRtl ? 1 : -1, 0);
            break;
          case _PageTransitionType.endToStart:
            offset = Offset(isRtl ? -1 : 1, 0);
            break;
          case _PageTransitionType.topToBottom:
            offset = const Offset(0, -1);
            break;
          case _PageTransitionType.bottomToTop:
            offset = const Offset(0, 1);
            break;
          default:
            Offset.zero;
        }

        return SlideTransition(
          position: Tween<Offset>(
            begin: offset,
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        );
      },
      pageBuilder: (_, __, ___) {
        return page;
      },
    );
  }
}

enum _PageTransitionType { startToEnd, endToStart, topToBottom, bottomToTop }
