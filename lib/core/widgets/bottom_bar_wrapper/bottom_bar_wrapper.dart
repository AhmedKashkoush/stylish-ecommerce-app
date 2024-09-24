import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/core/constants/colors.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/drawers/custom_drawer.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/screens/home_screen.dart';

part 'widgets/custom_bottom_bar.dart';
part 'widgets/custom_nav_item.dart';
part 'widgets/cart_button.dart';

class BottomBarWrapper extends StatefulWidget {
  const BottomBarWrapper({Key? key}) : super(key: key);

  @override
  State<BottomBarWrapper> createState() => _BottomBarWrapperState();
}

class _BottomBarWrapperState extends State<BottomBarWrapper> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _rootKey = GlobalKey<ScaffoldState>();
  final PageController _controller = PageController();
  late final List<Widget> _screens = [
    HomeScreen(
      rootKey: _rootKey,
    ),
    const Center(
      child: Text('WishList'),
    ),
    const Center(
      child: Text('Notifications'),
    ),
    const Center(
      child: Text('Settings'),
    ),
  ];
  final List<String> _labels = [
    'Home',
    'Wishlist',
    'Notifications',
    'Settings',
  ];
  final List<IconData> _icons = [
    HugeIcons.strokeRoundedHome09,
    HugeIcons.strokeRoundedFavourite,
    HugeIcons.strokeRoundedNotification01,
    HugeIcons.strokeRoundedSettings01,
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _rootKey,
      drawer: const CustomDrawer(),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomBar(
        icons: _icons,
        labels: _labels,
        currentIndex: _currentIndex,
        onChangeTab: _changeTab,
      ),
    );
  }

  void _changeTab(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }
}
