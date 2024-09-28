import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/TrackOrder/track_screen.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Container(
        height: 140,
        width: double.infinity,
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: isDarkTheme ? Colors.black : Colors.white,
          border: const Border.symmetric(
            horizontal: BorderSide(
                color: Color.fromARGB(255, 184, 182, 182), width: 1.5),
          ),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'EGP 7,000.00',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkTheme
                        ? Colors.redAccent
                        : const Color(0xffF83758),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TrackOrderScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isDarkTheme ? Colors.redAccent : const Color(0xffF83758),
                fixedSize: const Size(219, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Proceed to Payment',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
