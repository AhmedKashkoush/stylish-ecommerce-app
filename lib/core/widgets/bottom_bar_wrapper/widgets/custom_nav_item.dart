part of '../bottom_bar_wrapper.dart';

class CustomNavItem extends StatelessWidget {
  const CustomNavItem({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  final IconData icon;
  final bool isActive;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HugeIcon(
          icon: icon,
          color: isActive ? AppColors.primary : context.theme.iconTheme.color!,
        ),
        3.height,
        FittedBox(
          child: Text(
            label,
            style: TextStyle(
              color:
                  isActive ? AppColors.primary : context.theme.iconTheme.color!,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
