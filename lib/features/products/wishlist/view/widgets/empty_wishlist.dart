import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/icons/custom_icon.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIcon(
          icon: HugeIcons.strokeRoundedFavourite,
          color: context.theme.iconTheme.color!.withOpacity(0.5),
        ),
        10.height,
        Text(
          'No items',
          style: context.theme.textTheme.bodyLarge?.copyWith(
            color: context.theme.textTheme.bodyLarge?.color?.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
