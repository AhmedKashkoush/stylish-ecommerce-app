import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stylish_ecommerce_app/core/constants/colors.dart';
import 'package:stylish_ecommerce_app/core/widgets/icons/custom_icon.dart';

class OfferButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool isOutlined;
  const OfferButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isOutlined = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return isOutlined
        ? OutlinedButton.icon(
            onPressed: onTap,
            iconAlignment: IconAlignment.end,
            style: OutlinedButton.styleFrom(
              foregroundColor: _buildForegroundColor(),
              side: _buildSide(),
              shape: _buildBorder(),
            ),
            icon: _buildIcon(isRtl),
            label: _buildText(),
          )
        : ElevatedButton.icon(
            onPressed: onTap,
            iconAlignment: IconAlignment.end,
            style: ElevatedButton.styleFrom(
              foregroundColor: _buildForegroundColor(),
              backgroundColor: _buildBackgroundColor(),
              shape: _buildBorder(),
            ),
            icon: _buildIcon(isRtl),
            label: _buildText(),
          );
  }

  BorderSide _buildSide() => const BorderSide(
        color: Colors.white,
      );

  Widget _buildText() => Text(
        text,
        overflow: TextOverflow.ellipsis,
      );

  Widget _buildIcon(bool isRtl) => CustomIcon(
        color: Colors.white,
        icon: isRtl
            ? HugeIcons.strokeRoundedArrowLeft02
            : HugeIcons.strokeRoundedArrowRight02,
      );
  Color _buildForegroundColor() => Colors.white;
  Color _buildBackgroundColor() => AppColors.primary;

  RoundedRectangleBorder _buildBorder() => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      );
}
