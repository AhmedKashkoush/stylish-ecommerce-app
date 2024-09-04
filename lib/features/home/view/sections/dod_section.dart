import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/features/home/model/dod_model.dart';
import 'package:stylish_ecommerce_app/features/home/view/widgets/deal_of_the_day/dod_list.dart';
import 'package:stylish_ecommerce_app/features/home/view/widgets/view_all_card/view_all_card.dart';

class DodSection extends StatelessWidget {
  final DodModel dealOfTheDay;
  const DodSection({super.key, required this.dealOfTheDay});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ViewAllCard(
          onTap: () {},
          type: ViewAllCardType.dealOfTheDay,
          until: dealOfTheDay.until,
        ),
        10.h,
        DodList(
          products: dealOfTheDay.products,
        ),
      ],
    );
  }
}
