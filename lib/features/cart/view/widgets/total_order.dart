import 'package:flutter/material.dart';

class TotalOrder extends StatelessWidget {
  const TotalOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Total',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              Text(
                'EGP 7,000.00',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'EMI Available',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Details',
                style: TextStyle(
                  fontSize: 12,
                  color:
                      isDarkTheme ? Colors.redAccent : const Color(0xffF83758),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
