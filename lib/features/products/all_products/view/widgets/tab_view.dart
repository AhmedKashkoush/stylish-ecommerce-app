import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_dod.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_trending.dart';
import 'package:stylish_ecommerce_app/features/products/all_products/view/widgets/product_card.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';

class TabView extends StatelessWidget {
  final String category;
  const TabView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    if (category.toLowerCase() == 'deal of the day') {
      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        itemBuilder: (_, index) => ProductCard(product: dummyDod[index]),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: dummyDod.length,
      );
    }
    if (category.toLowerCase() == 'trending') {
      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        itemBuilder: (_, index) => ProductCard(product: dummyTrending[index]),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: dummyTrending.length,
      );
    }
    final List<ProductModel> products = [
      ...dummyDod,
      ...dummyTrending,
    ].where((product) => product.category == category.toLowerCase()).toList();
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemBuilder: (_, index) => ProductCard(product: products[index]),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: products.length,
    );
  }
}
