part of '../bottom_bar_wrapper.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 10,
      color: Colors.transparent,
      shadowColor: context.theme.iconTheme.color!.withOpacity(0.3),
      shape: BoxShape.circle,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.cart);
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.primary,
        child: const HugeIcon(
          icon: HugeIcons.strokeRoundedShoppingCart01,
          color: Colors.white,
        ),
      ),
    );
  }
}
