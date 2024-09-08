import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_categories.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_dod.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_sales.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_trending.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/app_bars/custom_app_bar.dart';
import 'package:stylish_ecommerce_app/features/home/model/offer_model.dart';
import 'package:stylish_ecommerce_app/features/home/view/sections/categories_section.dart';
import 'package:stylish_ecommerce_app/features/home/view/sections/dod_section.dart';
import 'package:stylish_ecommerce_app/features/home/view/sections/sales_section.dart';
import 'package:stylish_ecommerce_app/features/home/view/sections/trending_section.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> rootKey;
  final void Function() onSearchTap;
  const HomeScreen({
    Key? key,
    required this.rootKey,
    required this.onSearchTap,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: widget.rootKey,
        onSearchTap: widget.onSearchTap,
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
          10.h,
          const CategoriesSection(
            categories: dummyCategories,
          ),
          10.h,
          SalesSection(offers: dummySales),
          10.h,
          DodSection(
            dealOfTheDay: OfferModel(
              until: DateTime.now().add(
                const Duration(days: 1),
              ),
              products: dummyDod,
            ),
          ),
          10.h,
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

  @override
  bool get wantKeepAlive => true;
}
