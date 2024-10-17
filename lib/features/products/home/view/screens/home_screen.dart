


import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';

import 'package:stylish_ecommerce_app/core/dummy/dummy_sales.dart';

import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/app_bars/custom_app_bar.dart';
import 'package:stylish_ecommerce_app/core/widgets/views/persistent_view.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/offer_model.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/sections/categories_section.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/sections/dod_section.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/sections/sales_section.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/sections/trending_section.dart';

import '../../view_model/home/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> rootKey;

  const HomeScreen({
    Key? key,
    required this.rootKey,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 // List<Product> products = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: widget.rootKey,
        onSearchTap: () => context.pushNamed(AppRoutes.search),
      ),
      backgroundColor: context.theme.colorScheme.surface,
      body: PersistentView(

        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {

            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            else if(state is HomeLoaded){


              return ListView(
                padding:  EdgeInsets.symmetric(horizontal:20.w, vertical:16.h),
                children: [
                   Text(
                    'All Featured',
                    style: TextStyle(
                      fontSize: 18.sp.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.height,
                   CategoriesSection(
                    categories: state.categories,
                  ),
                  10.height,
                   SalesSection(offers: dummySales),
                  10.height,
                  DodSection(
                    dealOfTheDay: OfferModel(
                      until: DateTime.now().add(
                        const Duration(days: 1),
                      ),
                      products: state.dealOfTheDayProducts,
                    ),
                  ),
                  10.height,
                  TrendingSection(
                    trending: OfferModel(
                      until: DateTime.now().add(
                        const Duration(days: 1),
                      ),
                      products: state.trendingProducts,
                    ),
                  ),
                ],
              );
            }
            else if (state is HomeError) {
              return Center(
                child: Text('Error: ${state.message}'),
              );
            } else {
              return const SizedBox();
            }

          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Fetch categories and products on initialization
    BlocProvider.of<HomeCubit>(context).loadHomeData();
    // Call your upload method here
    // ProductService().uploadProductsToFiresStore();
   }


}

