import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_wishlist.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/app_bars/custom_app_bar.dart';
import 'package:stylish_ecommerce_app/core/widgets/views/persistent_view.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/empty_wishlist.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/wishlist_widget.dart';

class WishlistScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> rootKey;
  const WishlistScreen({super.key, required this.rootKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: rootKey,
        onSearchTap: () => context.pushNamed(AppRoutes.search),
      ),
      backgroundColor: context.theme.colorScheme.surface,
      body: myDummyWishList.isEmpty
          ? const EmptyWishlist()
          : PersistentView(
              child: WishlistWidget(items: myDummyWishList),
            ),
    );
  }
}
