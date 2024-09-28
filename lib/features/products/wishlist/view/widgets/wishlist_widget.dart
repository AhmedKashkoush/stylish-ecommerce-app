import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stylish_ecommerce_app/core/extensions/bottom_sheet_extension.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/action_bar.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/bottom_sheets/filter/filter_bottom_sheet.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/bottom_sheets/filter/filter_options.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/bottom_sheets/sort_bottom_sheet.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/empty_wishlist.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/wishlist_item.dart';

class WishlistWidget extends StatefulWidget {
  final List<ProductModel> items;
  const WishlistWidget({super.key, required this.items});

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  final List<String> _sortOptions = [
    'Price',
    'Ratings',
  ];
  late String _sortingOption;
  late final ValueNotifier<FilterOptions> _options;

  @override
  void initState() {
    _sortingOption = _sortOptions.first.toLowerCase();

    _options = ValueNotifier<FilterOptions>(
      FilterOptions(
        filters: [],
        filteredItems: _sortList(widget.items),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder(
                  valueListenable: _options,
                  builder: (_, options, __) {
                    return Text(
                      '${options.filteredItems.length} Items',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }),
              ActionBar(
                onSort: () => _showSortBottomSheet(context),
                onFilter: () => _showFilterBottomSheet(context),
                options: _options,
              ),
            ],
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: _options,
            builder: (_, options, __) {
              return options.filteredItems.isEmpty
                  ? const EmptyWishlist()
                  : MasonryGridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isPortrait ? 2 : 3,
                      ),
                      itemCount: options.filteredItems.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WishlistItem(
                          item: options.filteredItems[index],
                        ),
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }

  void _showSortBottomSheet(BuildContext context) async {
    String? sortOption = await context.showBottomSheet(
      content: SortBottomSheet(
        sortOptions: _sortOptions,
        selected: _sortingOption,
      ),
    );

    if (sortOption == null) return;
    _sortingOption = sortOption;

    _options.value = _options.value.copyWith(
      filteredItems: _sortList(_options.value.filteredItems),
    );
  }

  void _showFilterBottomSheet(BuildContext context) async {
    final FilterOptions? result = await context.showBottomSheet(
      content: FilterBottomSheet(
        items: widget.items,
        options: _options.value,
      ),
    );

    if (result == null) return;

    _options.value = result.copyWith(
      filteredItems: _sortList(
        result.filters.isEmpty ? widget.items : result.filteredItems,
      ),
    );
  }

  List<ProductModel> _sortList(List<ProductModel> list) {
    List<ProductModel> sortedList = List.from(list);
    if (_sortingOption == _sortOptions.first.toLowerCase()) {
      sortedList.sort((a, b) => b.price.compareTo(a.price));
    }
    if (_sortingOption == _sortOptions.last.toLowerCase()) {
      sortedList.sort((a, b) => b.rate.compareTo(a.rate));
    }
    return sortedList;
  }
}
