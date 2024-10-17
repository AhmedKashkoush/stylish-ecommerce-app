import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/features/settings/widgets/listtile_items.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkTheme
          ? const Color(0xFF212121)
          : const Color.fromARGB(255, 238, 238, 238),
      body: DefaultTextStyle(
        style: TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
        child: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(vertical:24.h, horizontal:15.w),
          child: Column(
            children: <Widget>[
               SizedBox(height:30.h),
              buildProfileHeader(isDarkTheme),
               SizedBox(height:20.h),
              buildLanguageTile(isDarkTheme),
              buildProfileSettingsTile(isDarkTheme,context),
              buildDarkModeTile(isDarkTheme),
              buildPushNotificationsTile(isDarkTheme),
              buildLogoutTile(isDarkTheme),
            ],
          ),
        ),
      ),
    );
  }
}
