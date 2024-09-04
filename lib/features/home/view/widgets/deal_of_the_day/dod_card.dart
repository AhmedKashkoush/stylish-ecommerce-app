import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/rating/star_rating_widget.dart';
import 'package:stylish_ecommerce_app/features/home/model/product_model.dart';

class DodCard extends StatelessWidget {
  final ProductModel product;
  const DodCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: context.theme.scaffoldBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          10.h,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.h,
              Text(
                product.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              10.h,
              Text(
                '${product.currency} ${product.sale != null ? (product.price - product.price * product.sale!) : product.price}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (product.sale != null) ...[
                10.h,
                Row(
                  children: [
                    Text(
                      '${product.currency} ${product.price}',
                      style: const TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    10.w,
                    Text(
                      '${product.sale! * 100}% OFF',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
              10.h,
              Row(
                children: [
                  StarRatingWidget(rate: product.rate),
                  10.w,
                  Text(
                    '${product.totalRate}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
