import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/buttons/offer_button.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/sales_offer_model.dart';

class SalesOfferCard extends StatelessWidget {
  final SalesOfferModel offer;
  final VoidCallback? onButtonTap;
  const SalesOfferCard({
    super.key,
    required this.offer,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(offer.image),
          fit: BoxFit.cover,
          alignment: Alignment.centerLeft,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            offer.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          4.height,
          Text(
            offer.description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          10.height,
          OfferButton(
            text: 'Shop Now',
            onTap: onButtonTap,
          ),
        ],
      ),
    );
  }
}
