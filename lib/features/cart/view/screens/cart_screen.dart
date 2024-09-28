import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/cart/view/widgets/order_details.dart';
import 'package:stylish_ecommerce_app/features/cart/view/widgets/payment_container.dart';
import 'package:stylish_ecommerce_app/features/cart/view/widgets/product_details.dart';
import 'package:stylish_ecommerce_app/features/cart/view/widgets/total_order.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          'Shopping Bag',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,            color: isDarkTheme ? Colors.white : Colors.black,

          ),
        ),
        actions:  [
          IconButton(
            onPressed: null,
            icon: Icon(
            color: isDarkTheme ? Colors.white : Colors.black,
              Icons.favorite_border_outlined,
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductDetails(),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Divider(
                  color: Color(0xffCACACA),
                  thickness: 1,
                ),
              ),
              OrderDetails(),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Divider(
                  color: Color(0xffCACACA),
                  thickness: 1,
                ),
              ),
              TotalOrder(),
              SizedBox(
                height: 53,
              ),
              PaymentContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
