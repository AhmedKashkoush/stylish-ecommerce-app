import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/constants/colors.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function(bool selected, String filter) onSelected;
  const CustomFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: selected ? Colors.white : null),
      ),
      checkmarkColor: Colors.white,
      showCheckmark: selected,
      shape: const StadiumBorder(),
      selected: selected,
      selectedColor: AppColors.primary,
      onSelected: (selected) => onSelected(selected, label.toLowerCase()),
    );
  }
}
