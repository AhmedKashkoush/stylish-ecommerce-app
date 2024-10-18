import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../home/model/product_model.dart';

abstract class WishListRepo {
  Future<void> addToWishList(ProductModel productModel);
  Future<void> removeFromWishList(ProductModel productModel);
  Future<List<ProductModel>> getWishList();
}

class WishlistRepoImpl extends WishListRepo {
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<void> addToWishList(ProductModel productModel) async {
    await _store
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('wishlist').doc(productModel.id)
        .set(productModel.toJson());
  }

  @override
  Future<List<ProductModel>> getWishList() async {
    return await _store
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('wishlist')
        .get().then((value) => value.docs.map((e) => ProductModel.fromJson(e.data())).toList());
  }

  @override
  Future<void> removeFromWishList(ProductModel productModel) async{
      await _store
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('wishlist').doc(productModel.id)
        .delete();
  }
}
