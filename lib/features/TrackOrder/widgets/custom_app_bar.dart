import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({super.key, required this.textBar});

  final String textBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
      decoration: const BoxDecoration(
        color: Color(0xffF83758),
      ),
      child: Text(
        textBar,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
