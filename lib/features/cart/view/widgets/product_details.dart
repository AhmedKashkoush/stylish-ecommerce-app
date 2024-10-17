import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
             SizedBox(
              height:10.h,
            ),
            Text(
              'Checked Single-Breasted Blazer',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
             SizedBox(
              height:10.h,
            ),
            const MyDropdownMenu(),
             SizedBox(
              height:10.h,
            ),
            Row(
              children: [
                Text(
                  'Delivery by',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: isDarkTheme ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                 SizedBox(
                  width:10.w,
                ),
                Text(
                  '10 May 2XXX',
                  style: TextStyle(
                    fontSize: 16.sp,
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
  MyDropdownMenuState createState() => MyDropdownMenuState();
}

class MyDropdownMenuState extends State<MyDropdownMenu> {
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
         SizedBox(width:30.w),
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
