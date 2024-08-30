part of 'view_all_card.dart';

class ViewAllButton extends StatelessWidget {
  final void Function()? onTap;
  const ViewAllButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return OutlinedButton.icon(
      onPressed: onTap,
      iconAlignment: IconAlignment.end,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      icon: CustomIcon(
        color: Colors.white,
        icon: isRtl
            ? HugeIcons.strokeRoundedArrowLeft02
            : HugeIcons.strokeRoundedArrowRight02,
      ),
      label: const Text('View all'),
    );
  }
}
