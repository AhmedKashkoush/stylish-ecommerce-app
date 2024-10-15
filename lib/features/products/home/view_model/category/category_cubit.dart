import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/category_model.dart';


import '../../model/repositories/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryCubit(this.categoryRepository) : super(CategoryInitial());
   List<CategoryModel> categories = [];

  Future<void> fetchCategories() async {
    try {
      emit(CategoryLoading());
      final fetchedCategories = await categoryRepository.fetchCategories();
      categories.addAll(fetchedCategories);
      emit(CategoryLoaded(fetchedCategories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
