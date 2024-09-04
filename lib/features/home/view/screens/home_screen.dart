import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_categories.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_dod.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/app_bars/custom_app_bar.dart';
import 'package:stylish_ecommerce_app/features/home/model/dod_model.dart';
import 'package:stylish_ecommerce_app/features/home/view/sections/categories_section.dart';
import 'package:stylish_ecommerce_app/features/home/view/sections/dod_section.dart';
import 'package:stylish_ecommerce_app/features/home/view/sections/sales_section.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> rootKey;
  final void Function() onSearchTap;
  const HomeScreen({
    Key? key,
    required this.rootKey,
    required this.onSearchTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: rootKey,
        onSearchTap: onSearchTap,
      ),
      backgroundColor: Colors.grey.shade200,
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
          const SalesSection(),
          10.h,
          DodSection(
            dealOfTheDay: DodModel(
              until: DateTime.now().add(
                const Duration(days: 1),
              ),
              products: dummyDod,
            ),
          ),
        ],
      ),
    );
  }
}
