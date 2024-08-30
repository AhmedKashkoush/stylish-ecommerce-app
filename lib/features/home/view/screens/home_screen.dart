import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/app_bars/custom_app_bar.dart';
import 'package:stylish_ecommerce_app/features/home/model/category_model.dart';
import 'package:stylish_ecommerce_app/features/home/view/sections/categories_section.dart';
import 'package:stylish_ecommerce_app/features/home/view/widgets/view_all_card/view_all_card.dart';

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
          CategoriesSection(
            categories: List.generate(
              10,
              (index) => const CategoryModel(
                name: 'category',
                image: 'assets/images/get_started.png',
              ),
            ),
          ),
          10.h,
          ViewAllCard(
            onTap: () {},
            type: ViewAllCardType.dealOfTheDay,
            until: DateTime.now().add(
              const Duration(days: 1),
            ),
          ),
        ],
      ),
    );
  }
}
