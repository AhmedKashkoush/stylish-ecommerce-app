import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/config/routes/router.dart';
import 'package:stylish_ecommerce_app/config/themes/themes.dart';
import 'package:stylish_ecommerce_app/core/constants/strings.dart';

class StylishApp extends StatelessWidget {
  const StylishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeMode: ThemeMode.system,
            initialRoute: AppRouter.initialRoute,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        });
  }
}
