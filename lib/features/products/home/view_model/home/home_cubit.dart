import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/category.dart';
import '../../model/product.dart';
import '../category/category_cubit.dart';
import '../product/product_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CategoryCubit categoryCubit;
  final ProductCubit productCubit;

  HomeCubit({
    required this.categoryCubit,
    required this.productCubit,
  }) : super(HomeInitial());

  // This function will fetch both categories and products for the home screen
  Future<void> loadHomeData() async {
    try {
      emit(HomeLoading());

      // Fetch categories using CategoryCubit
      await categoryCubit.fetchCategories();
      final categoriesState = categoryCubit.state;

      if (categoriesState is CategoryLoaded) {
        final categories = categoriesState.categories;

        // Fetch products for the first category (or default)
        if (categories.isNotEmpty) {


          await fetchProductsForSections(categories);
        } else {
          emit(HomeError('No categories found.'));
        }
      } else if (categoriesState is CategoryError) {
        emit(HomeError(categoriesState.message));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

// Helper method to fetch products for two sections

  Future<void> fetchProductsForSections(List<Category> categories) async {

    try{

      // Assuming you know the category ID for each section
      String dealOfTheDayCategoryId = "Beauty";
      String trendingCategoryId = "Fashion";

      // Fetch products for "Deal of the Day"
      await productCubit.fetchProducts(dealOfTheDayCategoryId);
      final dealOfTheDayState = productCubit.state;

      // Fetch products for "Trending Products"
      await productCubit.fetchProducts(trendingCategoryId);
      final trendingState = productCubit.state;
      
      if(dealOfTheDayState is ProductLoaded && trendingState is ProductLoaded){
        final dealOfTheDayProducts = dealOfTheDayState.products;
        final trendingProducts = trendingState.products;
        emit(HomeLoaded(categories: categories,
            trendingProducts: trendingProducts,
            dealOfTheDayProducts: dealOfTheDayProducts));
      }
     else{
       emit(HomeError("Error loading products for sections."));
      }

    }
    catch (e) {
      emit(HomeError(e.toString()));
    }



  }

}
