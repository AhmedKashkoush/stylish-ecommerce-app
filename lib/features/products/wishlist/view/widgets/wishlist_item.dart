import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/rating/star_rating_widget.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';

class WishlistItem extends StatelessWidget {
  final ProductModel item;
  const WishlistItem({super.key, required this.item});

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
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: CachedNetworkImage(
              imageUrl: item.image,
              errorWidget: (context, url, error) => const Center(
                child: Icon(
                  Icons.error,
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(6.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:  TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                6.height,
                Text(
                  item.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:  TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                6.height,
                Text(
                  '${item.currency} ${item.sale != null ? (item.price - item.price * item.sale!) : item.price}',
                  style:  TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (item.sale != null)
                  Row(
                    children: [
                      4.width,
                      Text(
                        '${item.currency} ${item.price}',
                        style:  TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          height:0.8.h,
                        ),
                      ),
                      10.width,
                      Text(
                        '${item.sale! * 100}% OFF',
                        style:  TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                          height:0.8.h,
                        ),
                      ),
                    ],
                  ),
                6.height,
                Row(
                  children: [
                    StarRatingWidget(rate: item.rate),
                    10.width,
                    Text(
                      '${item.totalRate}',
                      style:  TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
