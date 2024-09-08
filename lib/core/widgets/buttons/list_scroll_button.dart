import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';

class ListScrollButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;
  final ListScrollButtonIconType iconType;
  const ListScrollButton({
    super.key,
    this.onTap,
    this.size = 50,
    this.iconType = ListScrollButtonIconType.next,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      // type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: Container(
          // clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor.withOpacity(0.7),
            gradient: RadialGradient(
              radius: 0.4,
              colors: [
                context.theme.iconTheme.color!.withOpacity(0.6),
                context.theme.iconTheme.color!.withOpacity(0.1),
              ],
            ),
          ),
          child: Icon(
            iconType == ListScrollButtonIconType.previous
                ? Icons.arrow_back_ios_outlined
                : Icons.arrow_forward_ios_outlined,
            size: size / 2,
          ),
        ),
      ),
    );
  }
}

enum ListScrollButtonIconType { previous, next }
