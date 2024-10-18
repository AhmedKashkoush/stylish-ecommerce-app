import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';

import '../../model/repository/wishlist_repo.dart';
import 'wishlist_states.dart';

class WishListCubit extends Cubit<WishListStates> {
  final WishListRepo wishListRepo;

  WishListCubit(this.wishListRepo) : super(WishListInitial());

  List<ProductModel> wishList = [];

  Future<void> getWishList() async {
    try {
      emit(WishListLoading());
      wishList = await wishListRepo.getWishList();
      emit(WishListSuccess());
    } catch (e) {
      emit(WishListError());
    }
  }

  Future<void> addToWishList(ProductModel product) async {
    try {
      emit(WishListLoading());

      await wishListRepo.addToWishList(product);

      getWishList();
    } catch (e) {
      emit(WishListError());
    }
  }
  Future<void> removeFromWishList(ProductModel product) async {
    try {
      emit(WishListLoading());
      await wishListRepo.removeFromWishList(product);
      getWishList();
  
    } catch (e) {
      emit(WishListError());
    }
  }
}
