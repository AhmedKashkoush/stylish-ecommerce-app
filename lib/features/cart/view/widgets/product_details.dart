import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset('assets/images/dress.png'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Women\'s Casual Wear',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Checked Single-Breasted Blazer',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const MyDropdownMenu(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Delivery by',
                  style: TextStyle(
                    fontSize: 13,
                    color: isDarkTheme ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '10 May 2XXX',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class MyDropdownMenu extends StatefulWidget {
  const MyDropdownMenu({super.key});

  @override
  _MyDropdownMenuState createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  String dropdownSize = '42';
  int dropdownQty = 1;

  final List<String> sizes = ['36', '38', '40', '42', '44', '46'];
  final List<int> quantities = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<String>(
          focusColor: const Color(0xffF2F2F2),
          dropdownColor: const Color(0xffF2F2F2),
          value: dropdownSize,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (String? newValue) {
            setState(() {
              dropdownSize = newValue!;
            });
          },
          items: sizes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(width: 30),
        DropdownButton<int>(
          value: dropdownQty,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (int? newValue) {
            setState(() {
              dropdownQty = newValue!;
            });
          },
          items: quantities.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        ),
      ],
    );
  }
}
