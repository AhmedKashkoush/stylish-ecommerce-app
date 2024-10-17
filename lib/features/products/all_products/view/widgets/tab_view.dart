import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_dod.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_trending.dart';
import 'package:stylish_ecommerce_app/features/products/all_products/view/widgets/product_card.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';
import 'package:stylish_ecommerce_app/features/products/home/view_model/product/product_cubit.dart';

class TabView extends StatefulWidget {
  final String category;

  const TabView({super.key, required this.category});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {

  @override
  void initState() {
    print("#########${widget.category}");
    context.read<ProductCubit>().fetchProducts(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.category.toLowerCase() == 'deal of the day') {
      return ListView.separated(
        padding:  EdgeInsets.symmetric(horizontal:20.w, vertical:16.h),
        itemBuilder: (_, index) => ProductCard(product: dummyDod[index]),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: dummyDod.length,
      );
    }
    if (widget.category.toLowerCase() == 'trending') {
      return ListView.separated(
        padding:  EdgeInsets.symmetric(horizontal:20.w, vertical:16.h),
        itemBuilder: (_, index) => ProductCard(product: dummyTrending[index]),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: dummyTrending.length,
      );
    }
    final List<ProductModel> products = context
        .read<ProductCubit>()
        .products;

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return ListView.separated(
          padding:  EdgeInsets.symmetric(horizontal:20.w, vertical:16.h),
          itemBuilder: (_, index) => ProductCard(product: products[index]),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: products.length,
        );
      },
    );
  }
}
