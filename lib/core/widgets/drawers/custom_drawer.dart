import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';

import '../../constants/strings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  title: Text(
                    'User Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('user123@email.com'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ),
                16.height,
                TextButton(
                  onPressed: () => _goToProfile(context),
                  child: const Text(AppStrings.viewProfile),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _goToProfile(BuildContext context) {
    context.pop();
    context.pushNamed(AppRoutes.profile);
  }
}
