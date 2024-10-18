import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/empty_wishlist.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/wishlist_widget.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view_model/cubit/wishlist_cubit.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view_model/cubit/wishlist_states.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/app_bars/custom_app_bar.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({
    Key? key,
    required this.rootKey,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> rootKey;
  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  // static List<ProductModel> wishlistItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          scaffoldKey: widget.rootKey,
          onSearchTap: () => context.pushNamed(AppRoutes.search),
        ),
        body: BlocBuilder<WishListCubit, WishListStates>(
          builder: (context, state) {
            if (state is WishListLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primary,
              ));
            }
            if (state is WishListError) {
              Center(
                child: Text(
                  "SomeThing went wrong",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            }

            var cubit = context.read<WishListCubit>();
            return cubit.wishList.isEmpty
                ? const EmptyWishlist()
                : WishlistWidget(items: cubit.wishList);
          },
        ));
  }
}
