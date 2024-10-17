import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/core/constants/colors.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_categories.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/core/widgets/chips/custom_filter_chip.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/category_model.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/bottom_sheets/filter/filter_options.dart';

part 'filters_list.dart';
part 'price_filter_section.dart';
part 'rating_filter_section.dart';
part 'categories_list.dart';

class FilterBottomSheet extends StatefulWidget {
  final List<ProductModel> items;
  final FilterOptions? options;
  const FilterBottomSheet({
    super.key,
    required this.items,
    this.options,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<String> _labels = ['On a sale', 'Price', 'Rating', 'Category'];
  late final ValueNotifier<List<String>> _filters =
      ValueNotifier<List<String>>([]);
  final ValueNotifier<List<ProductModel>> _filteredItems =
      ValueNotifier<List<ProductModel>>([]);
  late ValueNotifier<RangeValues?> _ratings, _price;
  late ValueNotifier<List<String>?> _categories;

  @override
  void initState() {
    _filters.value = List.from(widget.options?.filters ?? []);
    _price = ValueNotifier(widget.options?.price ?? const RangeValues(0, 1000));
    _ratings =
        ValueNotifier(widget.options?.ratings ?? const RangeValues(0, 1));
    _categories = ValueNotifier(List.from(widget.options?.categories ?? []));
    _filter();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(12.0.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: context.theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _filters,
                builder: (_, filters, child) => TextButton(
                  onPressed: filters.isEmpty ? null : _reset,
                  child: child!,
                ),
                child: const Text('Reset'),
              ),
            ],
          ),
          const Divider(thickness: 1),
          FiltersList(
            labels: _labels,
            selectedFilters: _filters,
            onSelected: _onFilterSelected,
          ),
          ValueListenableBuilder(
            valueListenable: _filters,
            builder: (_, filters, __) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (filters.contains(_labels[1].toLowerCase()))
                    PriceFilterSection(
                      price: _price,
                      onChanged: (values) {
                        _price.value = values;
                        _filter();
                      },
                    ),
                  if (filters.contains(_labels[2].toLowerCase()))
                    RatingsFilterSection(
                      ratings: _ratings,
                      onChanged: (values) {
                        _ratings.value = values;
                        _filter();
                      },
                    ),
                  if (filters.contains(_labels.last.toLowerCase())) ...[
                    5.height,
                     Text(
                      'Categories:',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    5.height,
                    CategoriesList(
                      categories: dummyCategories,
                      selectedCategories: _categories,
                      onSelected: _onCategorySelected,
                    ),
                  ],
                ],
              );
            },
          ),
          const Divider(thickness: 1),
          ValueListenableBuilder(
            valueListenable: _filteredItems,
            builder: (_, items, __) {
              return ElevatedButton(
                onPressed: () => _showResults(context),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.maxFinite, 52),
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Show Results ${items.isNotEmpty ? '(${items.length})' : ''}',
                  style:  TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _reset() {
    _filters.value = [];
    _price.value = null;
    _ratings.value = null;
    _categories.value = null;
    _filter();
  }

  @override
  void dispose() {
    _filters.value = [];
    _price.value = null;
    _ratings.value = null;
    _categories.value = null;
    super.dispose();
  }

  void _showResults(BuildContext context) {
    final FilterOptions result = FilterOptions(
      filters: _filters.value,
      filteredItems: _filteredItems.value,
      price: _price.value,
      ratings: _ratings.value,
      categories: _categories.value ?? [],
    );

    context.pop(result: result);
  }

  void _onCategorySelected(bool selected, String category) {
    if (selected) {
      _categories.value?.add(category);
    } else {
      _categories.value?.remove(category);
    }
    _categories.value = List.from(_categories.value!);
    _filter();
  }

  void _onFilterSelected(bool selected, String filter) {
    if (selected) {
      if (filter == _labels[1].toLowerCase()) {
        _price.value ??= const RangeValues(0, 1000);
      }
      if (filter == _labels[2].toLowerCase()) {
        _ratings.value ??= const RangeValues(0, 1);
      }
      if (filter == _labels.last.toLowerCase()) {
        _categories.value ??= [];
      }
      _filters.value.add(filter);
    } else {
      _filters.value.remove(filter);
    }
    _filters.value = List.from(_filters.value);

    _filter();
  }

  void _filter() {
    _filteredItems.value = [];
    List<ProductModel> filteredItems = widget.items;
    if (_filters.value.contains(_labels.first.toLowerCase())) {
      _filteredItems.value =
          filteredItems.where((item) => item.sale != null).toList();
      filteredItems = List.from(_filteredItems.value);
    }
    if (_filters.value.contains(_labels[1].toLowerCase())) {
      _filteredItems.value = filteredItems
          .where((item) =>
              item.price >= _price.value!.start &&
              item.price <= _price.value!.end)
          .toList();
      filteredItems = List.from(_filteredItems.value);
    }
    if (_filters.value.contains(_labels[2].toLowerCase())) {
      _filteredItems.value = filteredItems
          .where((item) =>
              item.rate >= _ratings.value!.start &&
              item.rate <= _ratings.value!.end)
          .toList();
      filteredItems = List.from(_filteredItems.value);
    }
    if (_filters.value.contains(_labels.last.toLowerCase())) {
      _filteredItems.value = filteredItems
          .where((item) =>
              _categories.value!.contains(item.category.toLowerCase()))
          .toList();
      filteredItems = List.from(_filteredItems.value);
    }
  }
}
