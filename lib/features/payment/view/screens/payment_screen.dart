import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //     size: 18,
        //   ),
        // ),
        title: const Text(
          'Checkout',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CustomRow(
              text1: "Order",
              text2: "7000.EGP",
            ),
            const CustomRow(
              text1: "Shipping",
              text2: "30.EGP",
            ),
            const CustomRow(
              text1: "Total",
              text2: "7030.EGP",
              color: Colors.black,
            ),
            const Divider(
              color: AppColors.grey,
            ),
            10.height,
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "Payment",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            15.height,
            CustomContainer(
              //  function: selectedWay(),
              isSelected: isSelected,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppImages.logo),
                  const Text(
                    "*********2109",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            15.height,
            CustomContainer(
              // function: selectedWay(),
              isSelected: !isSelected,
              child: const Row(
                children: [
                  Text(
                    "Pay On Delivery",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            50.height,
            const CustomElevatedButton()
          ],
        ),
      ),
    );
  }

  void selectedWay() {
    isSelected = !isSelected;
    setState(() {});
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 59,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                title: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(AppImages.logo),
                    const Positioned(
                      top: 20,
                      left: 18,
                      child: Icon(
                        Icons.check,
                        color: AppColors.backgroundLight,
                        size: 50,
                      ),
                    ),
                  ],
                ),
                8.height ,
                const Text('Payment done successfully.' , 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14, 
            fontWeight: FontWeight.w600
          ),
          ),
              ],
            )),
          );
        },
        child: const Text(
          "Continue",
          style: TextStyle(
            color: AppColors.backgroundLight,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    required this.isSelected,
    // required this.function
  });
  final Widget? child;
  final bool isSelected;
//void function ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 59,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.lightGrey,
          ),
        ),
        child: child,
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.text1,
    required this.text2,
    this.color = AppColors.grey,
  });

  final String text1;
  final String text2;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
