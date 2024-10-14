import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_categories.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_dod.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_sales.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_trending.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/app_bars/custom_app_bar.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/offer_model.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/sections/categories_section.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/sections/dod_section.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/sections/sales_section.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/sections/trending_section.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> rootKey;

  const HomeScreen({
    Key? key,
    required this.rootKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: rootKey,
        onSearchTap: () => context.pushNamed(AppRoutes.search),
      ),
      backgroundColor: context.theme.colorScheme.surface,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          const Text(
            'All Featured',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.height,
          const CategoriesSection(
            categories: dummyCategories,
          ),
          10.height,
          SalesSection(offers: dummySales),
          10.height,
          DodSection(
            dealOfTheDay: OfferModel(
              until: DateTime.now().add(
                const Duration(days: 1),
              ),
              products: dummyDod,
            ),
          ),
          10.height,
          TrendingSection(
            trending: OfferModel(
              until: DateTime.now().add(
                const Duration(days: 1),
              ),
              products: dummyTrending,
            ),
          ),
        ],
      ),
    );
  }
}
