part of '../bottom_bar_wrapper.dart';

class CustomBottomBar extends StatelessWidget {
  final List<IconData> icons;
  final List<String> labels;
  final Function(int) onChangeTab;
  final int currentIndex;
  const CustomBottomBar({
    super.key,
    required this.icons,
    required this.onChangeTab,
    this.currentIndex = 0,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.none,
      surfaceTintColor: Colors.transparent,
      color: context.theme.scaffoldBackgroundColor,
      elevation: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length + 1, (index) {
          final int mid = (icons.length ~/ 2);
          if (index == mid) {
            return Transform(
              transform: Matrix4.identity()..translate(0.0, -20.0),
              child: const CartButton(),
            );
          }
          final int selectedIndex = index >= mid ? index - 1 : index;
          return Expanded(
            child: MaterialButton(
              onPressed: () => onChangeTab(selectedIndex),
              padding: const EdgeInsets.all(4),
              shape: const StadiumBorder(),
              child: CustomNavItem(
                icon: icons[selectedIndex],
                isActive: selectedIndex == currentIndex,
                label: labels[selectedIndex],
              ),
            ),
          );
        }),
      ),
    );
  }
}
