import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/repository/cart_repository.dart';

part 'cart_state.dart'; // Import the CartState definition

class CartCubit extends Cubit<CartState> {
  final CartRepository _cartRepository;

  CartCubit(this._cartRepository) : super(CartInitial());

  Future<void> addProduct(String productId, String productName, double price, String imageUrl) async {
    emit(CartLoading());
    try {
      await _cartRepository.addToCart(productId, productName, price, imageUrl);
      emit(CartSuccess("Product added to cart successfully!"));
    } catch (error) {
      emit(CartError("Failed to add product to cart: $error"));
    }
  }

// Additional methods for loading cart items, removing items, etc. can be added here

  Future<void> loadCartItems() async {
    emit(FetchCartLoading());
    try {
      List<dynamic> cartItems = await _cartRepository.loadCartItems();
      emit(FetchCartLoaded(cartItems));
    } catch (e) {
      emit(FetchCartError(e.toString()));
    }
  }
}
