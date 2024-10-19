import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view_model/cubit/wishlist_states.dart';

import '../../../../core/widgets/app_bars/custom_app_bar.dart';
import '../../../cart/view_model/cart_cubit.dart';
import '../../home/model/product_model.dart';
import '../../wishlist/view_model/cubit/wishlist_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isInWishlist = false;

  @override
  void initState() {
    var cubit = BlocProvider.of<WishListCubit>(context);
    isInWishlist = cubit.wishList
        .where((element) => element.id == widget.product.id)
        .isNotEmpty;
    super.initState();
  }

  void toggleWishlist(BuildContext context, ProductModel product) async {
    var cubit = BlocProvider.of<WishListCubit>(context);

    if (!isInWishlist) {
      await cubit.addToWishList(product);
    } else {
      await cubit.removeFromWishList(product);
    }

  
  }

  void addToCart(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    cartCubit.addProduct(widget.product.id, widget.product.name, widget.product.price, widget.product.image);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: BlocBuilder<WishListCubit, WishListStates>(
          builder: (context, state) {
            var cubit = BlocProvider.of<WishListCubit>(context);
            return IconButton(
              onPressed: () => toggleWishlist(context, widget.product),
              icon: Icon(
                cubit.wishList
                        .where((element) => element.id == widget.product.id)
                        .isNotEmpty
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: cubit.wishList
                        .where((element) => element.id == widget.product.id)
                        .isNotEmpty
                    ? Colors.red
                    : null,
              ),
            );
          },
        ),
        title: Text(
          "Product Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Image.network(
                    widget.product.image,
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              16.height,

              Text(
                widget.product.name,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              16.height,

              Text(
                '\$${widget.product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              16.height,

              // Product Description
              Text(
                widget.product.description,
                style: TextStyle(fontSize: 12.sp, height: 1.5.h),
              ),

              16.height,
              // Add to Cart Button
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    addToCart(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added to cart!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent, // Customize button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
