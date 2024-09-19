import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/constants/colors.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_categories.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/chips/custom_filter_chip.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';

class FilterBottomSheet extends StatefulWidget {
  final List<ProductModel> items;
  const FilterBottomSheet({
    super.key,
    required this.items,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<String> _filters = [];
  final ValueNotifier<List<ProductModel>> _filteredItems =
      ValueNotifier<List<ProductModel>>([]);
  final List<String> _labels = ['On a sale', 'Price', 'Rating', 'Category'];
  RangeValues? _ratings, _price;
  List<String>? _categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Filters',
            style: context.theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(thickness: 1),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _labels
                .map(
                  (filter) => CustomFilterChip(
                    label: filter,
                    selected: _filters.contains(filter.toLowerCase()),
                    onSelected: _onFilterSelected,
                  ),
                )
                .toList(),
          ),
          if (_filters.contains(_labels[1].toLowerCase()))
            PriceFilterSection(
              price: _price,
              onChanged: (values) {
                _price = values;
                _filter();
                setState(() {});
              },
            ),
          if (_filters.contains(_labels[2].toLowerCase()))
            RatingsFilterSection(
              ratings: _ratings,
              onChanged: (values) {
                _ratings = values;
                _filter();
                setState(() {});
              },
            ),
          if (_filters.contains(_labels.last.toLowerCase()))
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                5.height,
                const Text(
                  'Categories:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                5.height,
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: dummyCategories
                      .map(
                        (category) => CustomFilterChip(
                          label: category.name,
                          selected: _categories!
                              .contains(category.name.toLowerCase()),
                          onSelected: _onCategorySelected,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          const Divider(thickness: 1),
          ValueListenableBuilder(
              valueListenable: _filteredItems,
              builder: (_, items, __) {
                return ElevatedButton(
                  onPressed:
                      _filters.isEmpty ? null : () => _showResults(context),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 52),
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Show Results ${items.isNotEmpty ? '(${items.length})' : ''}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  void _showResults(BuildContext context) {
    final (List<String>, List<ProductModel>) result =
        (_filters, _filteredItems.value);
    context.pop(result: result);
  }

  void _onCategorySelected(bool selected, String category) {
    setState(() {
      if (selected) {
        _categories?.add(category);
      } else {
        _categories?.remove(category);
      }
      _filter();
    });
  }

  void _onFilterSelected(bool selected, String filter) {
    setState(() {
      if (selected) {
        if (filter == _labels[1].toLowerCase()) {
          _price ??= const RangeValues(0, 0);
        }
        if (filter == _labels[2].toLowerCase()) {
          _ratings ??= const RangeValues(0, 0);
        }
        if (filter == _labels.last.toLowerCase()) {
          _categories ??= [];
        }
        _filters.add(filter);
      } else {
        if (filter == _labels[1].toLowerCase()) {
          _price = null;
        }
        if (filter == _labels[2].toLowerCase()) {
          _ratings = null;
        }
        if (filter == _labels.last.toLowerCase()) {
          _categories = null;
        }
        _filters.remove(filter);
      }
      _filter();
    });
  }

  void _filter() {
    _filteredItems.value.clear();
    List<ProductModel> filteredItems = widget.items;
    if (_filters.contains(_labels.first.toLowerCase())) {
      _filteredItems.value =
          filteredItems.where((item) => item.sale != null).toList();
      filteredItems = List.from(_filteredItems.value);
    }
    if (_filters.contains(_labels[1].toLowerCase()) && _price != null) {
      _filteredItems.value = filteredItems
          .where((item) =>
              item.price >= _price!.start && item.price <= _price!.end)
          .toList();
      filteredItems = List.from(_filteredItems.value);
    }
    if (_filters.contains(_labels[2].toLowerCase()) && _ratings != null) {
      _filteredItems.value = filteredItems
          .where((item) =>
              item.rate >= _ratings!.start && item.rate <= _ratings!.end)
          .toList();
      filteredItems = List.from(_filteredItems.value);
    }
    if (_filters.contains(_labels.last.toLowerCase()) && _categories != null) {
      _filteredItems.value = filteredItems
          .where((item) => _categories!.contains(item.category.toLowerCase()))
          .toList();
      filteredItems = List.from(_filteredItems.value);
    }
  }
}

class RatingsFilterSection extends StatelessWidget {
  final RangeValues? ratings;
  final void Function(RangeValues)? onChanged;
  const RatingsFilterSection({super.key, this.ratings, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Rating:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        5.width,
        const Text(
          '0',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        2.width,
        Icon(Icons.star, color: Colors.yellowAccent.shade700),
        5.width,
        Expanded(
          child: RangeSlider(
            min: 0,
            max: 5,
            divisions: 10,
            labels: RangeLabels(
              ratings?.start.toString() ?? '0',
              ratings?.end.toString() ?? '0',
            ),
            values: ratings ?? const RangeValues(0, 0),
            onChanged: onChanged,
          ),
        ),
        const Text(
          '5',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        2.width,
        Icon(Icons.star, color: Colors.yellowAccent.shade700),
      ],
    );
  }
}

class PriceFilterSection extends StatelessWidget {
  final RangeValues? price;
  final void Function(RangeValues)? onChanged;
  const PriceFilterSection({super.key, this.price, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Price:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        5.width,
        const Text(
          '0 EGP',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: RangeSlider(
            min: 0,
            max: 10000,
            divisions: 10,
            labels: RangeLabels(
              price?.start.toString() ?? '0',
              price?.end.toString() ?? '0',
            ),
            values: price ?? const RangeValues(0, 0),
            onChanged: onChanged,
          ),
        ),
        const Text(
          '10000 EGP',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
