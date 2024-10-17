import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/action_bar.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/bottom_sheets/filter/filter_options.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/empty_wishlist.dart';
import 'package:stylish_ecommerce_app/features/products/wishlist/view/widgets/wishlist_item.dart';

class WishlistWidget extends StatefulWidget {
  final List<ProductModel> items;
  const WishlistWidget({super.key, required this.items});

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  late final ValueNotifier<FilterOptions> _options;

  @override
  void initState() {
    super.initState();
    _options = ValueNotifier<FilterOptions>(
      FilterOptions(
        filters: [],
        filteredItems: widget.items,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:20.w, vertical:16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.items.length} Items',
                style:  TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ActionBar(
                onSort: _sortWishlist,
                onFilter: _filterWishlist,
                options: _options,
              ),
            ],
          ),
        ),
        Expanded(
          child: widget.items.isEmpty
              ? const EmptyWishlist()
              : MasonryGridView.builder(
                  padding:  EdgeInsets.symmetric(horizontal:12.w),
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isPortrait ? 2 : 3,
                  ),
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) => Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: WishlistItem(item: widget.items[index]),
                  ),
                ),
        ),
      ],
    );
  }

  void _sortWishlist() {
    // Sorting logic here, if needed.
  }

  void _filterWishlist() {
    // Filtering logic here, if needed.
  }
}
