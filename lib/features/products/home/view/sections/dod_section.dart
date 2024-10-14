import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_categories.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/offer_model.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/widgets/deal_of_the_day/dod_list.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/widgets/view_all_card/view_all_card.dart';

class DodSection extends StatelessWidget {
  final OfferModel dealOfTheDay;
  const DodSection({super.key, required this.dealOfTheDay});

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
              'initialTab': 'Deal Of The Day',
            },
          ),
          type: ViewAllCardType.dealOfTheDay,
          until: dealOfTheDay.until,
        ),
        10.height,
        DodList(
          products: dealOfTheDay.products,
        ),
      ],
    );
  }
}
