import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/category_model.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/widgets/category_card.dart';

class CategoriesSection extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 88,
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => CategoryCard(
          category: categories[index],
        ),
        separatorBuilder: (_, index) => 12.width,
        itemCount: categories.length,
      ),
    );
  }
}
