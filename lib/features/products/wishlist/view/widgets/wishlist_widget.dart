import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stylish_ecommerce_app/core/extensions/bottom_sheet_extension.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/action_bar.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/bottom_sheets/filter_bottom_sheet.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/bottom_sheets/sort_bottom_sheet.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/wishlist_item.dart';

class WishlistWidget extends StatelessWidget {
  final List<ProductModel> items;
  const WishlistWidget({super.key, required this.items});

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
              Text(
                '${items.length} Items',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ActionBar(
                onSort: () => _showSortBottomSheet(context),
                onFilter: () => _showFilterBottomSheet(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: MasonryGridView.builder(
            key: const PageStorageKey('wishlist-key'),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isPortrait ? 2 : 3,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: WishlistItem(
                item: items[index],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    context.showBottomSheet(content: const SortBottomSheet());
  }

  void _showFilterBottomSheet(BuildContext context) async {
    final (List<String>, List<ProductModel>)? result =
        await context.showBottomSheet(
      content: FilterBottomSheet(
        items: items,
      ),
    );
    if (result == null) return;
    print('filters: ${result.$1}');
    print('items: ${result.$2}');
  }
}
