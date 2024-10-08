import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 15),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30.0),
              buildProfileHeader(isDarkTheme),
              const SizedBox(height: 20.0),
              buildLanguageTile(isDarkTheme),
              buildProfileSettingsTile(isDarkTheme),
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
