import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/features/products/home/view_model/category/category_cubit.dart';

import '../../model/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRoutes.products,
        arguments: {
          'categories': context.read<CategoryCubit>().categories,
          'initialTab': category.name,
        },
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0.r),
            child: Image.network(
              category.image, // Assuming category has an image field
              height:50.h.h,
              width:50.w.w,
              fit: BoxFit.cover,
            ),
          ),
          4.height,
          Text(
            category.name,
            style:  TextStyle(
              fontSize: 10.sp.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
