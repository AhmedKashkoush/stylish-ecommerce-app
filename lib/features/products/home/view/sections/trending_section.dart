import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_categories.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/offer_model.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/widgets/trending/trending_list.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/widgets/view_all_card/view_all_card.dart';

class TrendingSection extends StatelessWidget {
  final OfferModel trending;
  const TrendingSection({
    super.key,
    required this.trending,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ViewAllCard(
          onTap: () => context.pushNamed(
            AppRoutes.products,
            arguments: {
              'categories': dummyCategories,
              'initialTab': 'Trending',
            },
          ),
          type: ViewAllCardType.trending,
          until: trending.until,
        ),
        10.height,
        TrendingList(
          products: trending.products,
        ),
      ],
    );
  }
}
