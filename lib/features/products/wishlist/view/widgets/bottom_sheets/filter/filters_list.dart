part of 'filter_bottom_sheet.dart';

class FiltersList extends StatelessWidget {
  final List<String> labels;
  final ValueNotifier<List<String>> selectedFilters;
  final void Function(bool, String) onSelected;
  const FiltersList({
    super.key,
    required this.labels,
    required this.selectedFilters,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedFilters,
      builder: (_, selectedFilters, __) {
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: labels
              .map(
                (filter) => CustomFilterChip(
                  label: filter,
                  selected: selectedFilters.contains(filter.toLowerCase()),
                  onSelected: onSelected,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
