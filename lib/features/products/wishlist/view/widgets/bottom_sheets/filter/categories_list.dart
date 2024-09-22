part of 'filter_bottom_sheet.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;
  final ValueNotifier<List<String>?> selectedCategories;
  final void Function(bool, String) onSelected;
  const CategoriesList({
    super.key,
    required this.categories,
    required this.selectedCategories,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedCategories,
      builder: (_, selectedCategories, __) {
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: categories
              .map(
                (category) => CustomFilterChip(
                  label: category.name,
                  selected:
                      selectedCategories!.contains(category.name.toLowerCase()),
                  onSelected: onSelected,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
