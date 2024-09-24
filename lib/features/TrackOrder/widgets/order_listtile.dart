import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderListTile extends StatelessWidget {
  const OrderListTile({
    super.key,
    required this.img,
    required this.imgColor,
    required this.title,
    this.subTitle,
    this.trailingWidget,
    required this.padding,
  });
  final String img;
  final Color imgColor;
  final double padding;
  final String title;
  final String? subTitle;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: padding),
          child: ListTile(
              leading: Container(
                width: 65,
                height: 90,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: imgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  img,
                  width: 40,
                  height: 40,
                ),
              ),
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              subtitle: subTitle != null
                  ? Text(
                      subTitle!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: isDarkTheme ? Colors.white : Colors.black,
                      ),
                    )
                  : null,
              trailing: trailingWidget),
        ),
      ],
    );
  }
}
