import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/features/cart/view/widgets/product_details.dart';
import 'package:stylish_ecommerce_app/features/cart/view_model/cart_cubit.dart';
import '../../model/repository/cart_repository.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartRepository = CartRepository();


  @override
  void initState() {
    cartRepository.loadCartItems();
  }

  @override
  Widget build(BuildContext context) {

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // Implement any actions to perform on state changes (e.g., showing a snackbar for errors)
      },
      builder: (context, state) {
        if (state is FetchCartLoading) {
          return _buildScaffold(
            context,
            title: 'Shopping Bag',
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is FetchCartLoaded) {
          final cartItems = state.cartItems;

          if (cartItems.isEmpty) {
            return _buildScaffold(
              context,
              title: 'Shopping Bag',
              body: Center(child: Text('Your cart is empty.')),
            );
          }

          return _buildScaffold(
            context,
            title: 'Shopping Bag',
            body: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Column(
                  children: [
                    ProductDetails(
                      product: item,
                      // You can pass other necessary data from `item` if needed
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0.r),
                      child: Divider(color: Color(0xffCACACA), thickness: 1),
                    ),
                  ],
                );
              },
            ),
          );
        } else if (state is FetchCartError) {
          return _buildScaffold(
            context,
            title: 'Shopping Bag',
            body: Center(child: Text('Error: ${state.message}')),
          );
        }

        return Scaffold(body: Center(child: Text('Something went wrong.')));
      },
    );
  }

  Scaffold _buildScaffold(BuildContext context, {required String title, required Widget body}) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: isDarkTheme ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              color: isDarkTheme ? Colors.white : Colors.black,
              Icons.favorite_border_outlined,
            ),
          ),
        ],
      ),
      body: body,
    );
  }
}
