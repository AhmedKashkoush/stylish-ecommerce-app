import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Sort By',
          style: context.theme.textTheme.headlineSmall,
        ),
        const Divider(
          thickness: 1,
        ),
        ListTile(
          onTap: () => _onDateAddedTap(context),
          title: Text(
            'Date added',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const Divider(
          thickness: 1,
        ),
        ListTile(
          onTap: () => _onPriceTap(context),
          title: Text(
            'Price',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const Divider(
          thickness: 1,
        ),
        ListTile(
          onTap: () => _onRatingTap(context),
          title: Text(
            'Rating',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  void _onDateAddedTap(BuildContext context) {
    context.pop();
  }

  void _onPriceTap(BuildContext context) {
    context.pop();
  }

  void _onRatingTap(BuildContext context) {
    context.pop();
  }
}
