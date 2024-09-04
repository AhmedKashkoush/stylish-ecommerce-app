import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget {
  const StarRatingWidget({
    super.key,
    required this.rate,
  });

  final double rate;

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
              color: _activeColor,
              size: _size,
            );
          }
          double remaining = rate - 1 / rate.floor() - 1;
          if (remaining > 0 && index == rate.ceil() - 1) {
            return Icon(
              Icons.star_half,
              color: _color,
              size: _size,
            );
          }

          return Icon(
            Icons.star_outline_outlined,
            color: _color,
            size: _size,
          );
        },
      ),
    );
  }

  double get _size => 14;
  Color get _activeColor => Colors.yellow.shade700;
  Color get _color => Colors.grey.shade300;
}
