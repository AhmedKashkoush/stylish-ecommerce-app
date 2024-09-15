import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/app_logo.dart';
import 'package:stylish_ecommerce_app/core/widgets/buttons/custom_icon_button.dart';
import 'package:stylish_ecommerce_app/core/widgets/fields/custom_search_bar.dart';
import 'package:stylish_ecommerce_app/core/widgets/icons/custom_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final void Function() onSearchTap;
  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
    required this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const AppLogo(
          showText: true,
        ),
        leading: CustomIconButton(
          onPressed: onDrawerTap,
          icon: const CustomIcon(
            icon: HugeIcons.strokeRoundedMenu02,
          ),
        ),
        actions: [
          // CustomIconButton(
          //   onPressed: onNotificationsTap,
          //   icon: const CustomIcon(
          //     icon: HugeIcons.strokeRoundedNotification02,
          //   ),
          // ),
          // 10.w,
          GestureDetector(
            onTap: () => onAvatarTap(context),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
            ),
          ),
          5.width,
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomSearchBar(
              onTap: onSearchTap,
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight * 2.5);

  void onDrawerTap() {
    scaffoldKey.currentState?.openDrawer();
  }

  void onNotificationsTap() {}

  void onAvatarTap(BuildContext context) {
    context.pushNamed(AppRoutes.profile);
  }
}
