import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';



class TrendingCard extends StatelessWidget {
  final ProductModel product;
  const TrendingCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: () => Navigator.pushNamed(context,AppRoutes.productDetails,
        arguments: product),
        child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: context.theme.scaffoldBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height:100.h,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(6.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    6.height,
                    Text(
                      '${product.currency} ${product.sale != null ? (product.price - product.price * product.sale!) : product.price}',
                      style:  TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (product.sale != null)
                      Row(
                        children: [
                          4.width,
                          Text(
                            '${product.currency} ${product.price}',
                            style:  TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              height:0.8.h,
                            ),
                          ),
                          10.width,
                          Flexible(
                            child: Text(
                              '${product.sale! * 100}% OFF',
                              style:  TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.red,
                                height:0.8.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
            ),
      );
  }
}
