import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


import '../../model/product_model.dart';
import '../../model/repositories/products_repositories.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  ProductCubit(this.productRepository) : super(ProductInitial());
List<ProductModel> products = [];
  Future<void> fetchProducts(String categoryId) async {
    try {
      emit(ProductLoading());
      final fetchedProducts = await productRepository.fetchProductsForCategory(categoryId);
      products.addAll(fetchedProducts);
         emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
