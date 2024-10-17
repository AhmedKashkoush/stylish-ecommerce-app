import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';

class WishlistScreen extends StatelessWidget {
  static List<ProductModel> wishlistItems = []; 

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: wishlistItems.isEmpty
          ? const Center(child: Text('Your wishlist is empty'))
          : ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final product = wishlistItems[index];
                return ListTile(
                  leading: Image.network(product.image, width:50.w, height:50.h),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                 
                );
              },
            ),
    );
  }
}
