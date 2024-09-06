import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget {
  final double rate, size;
  final Color? color, rateColor;
  const StarRatingWidget({
    super.key,
    required this.rate,
    this.size = 16,
    this.color,
    this.rateColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          if (rate - 1 >= index) {
            return Icon(
              Icons.star,
              color: rateColor ?? _rateColor,
              size: size,
            );
          }
          double remaining = rate - 1 / rate.floor() - 1;
          if (remaining > 0 && index == rate.ceil() - 1) {
            return Icon(
              Icons.star_half,
              color: color ?? _color,
              size: size,
            );
          }

          return Icon(
            Icons.star_outline_outlined,
            color: color ?? _color,
            size: size,
          );
        },
      ),
    );
  }

  Color get _rateColor => Colors.yellow.shade700;
  Color get _color => Colors.grey.shade300;
}
