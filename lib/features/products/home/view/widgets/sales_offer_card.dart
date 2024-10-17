import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/buttons/offer_button.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/sales_offer_model.dart';

import '../../../../../core/constants/colors.dart';

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
      margin: EdgeInsets.symmetric(
        horizontal:5.w,
      ),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(
          image: AssetImage(offer.image),
          fit: BoxFit.cover,
          alignment: Alignment.centerLeft,
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.black.withOpacity(.5),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal:16.w,
              vertical:8.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                4.height,
                Text(
                  offer.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                5.height,
                OfferButton(
                  text: 'Shop Now',
                  onTap: onButtonTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
