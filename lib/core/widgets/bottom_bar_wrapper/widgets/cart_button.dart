part of '../bottom_bar_wrapper.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      shape: const CircleBorder(),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: HugeIcon(
        icon: HugeIcons.strokeRoundedShoppingCart01,
        color: context.theme.iconTheme.color!,
      ),
    );
  }
}
