import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/config/routes/router.dart';
import 'package:stylish_ecommerce_app/config/themes/themes.dart';
import 'package:stylish_ecommerce_app/core/constants/strings.dart';

class StylishApp extends StatelessWidget {
  const StylishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.system,
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
