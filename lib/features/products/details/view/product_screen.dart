import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/screens/wishlist_screen.dart';

import '../../home/model/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isInWishlist = false;
  void toggleWishlist(ProductModel product) {
    setState(() {
      isInWishlist = !isInWishlist;
      if (isInWishlist) {
        WishlistScreen.wishlistItems.add(product);
      } else {
        WishlistScreen.wishlistItems.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: () => toggleWishlist(widget.product),
            icon: Icon(
              isInWishlist ? Icons.favorite : Icons.favorite_border,
              color: isInWishlist ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Image.network(
                widget.product.image,
                height:250.h,
                width:250.w,
                fit: BoxFit.cover,
              ),
            ),
             SizedBox(height:20.h),

            Text(
              widget.product.name,
              style:  TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height:10.h),

            Text(
              '\$${widget.product.price.toStringAsFixed(2)}',
              style:  TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
             SizedBox(height:20.h),

            // Product Description
            Text(
              widget.product.description,
              style:  TextStyle(fontSize: 16.sp, height:1.5.h),
            ),
            const Spacer(),

            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              height:50.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent, // Customize button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:  Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
