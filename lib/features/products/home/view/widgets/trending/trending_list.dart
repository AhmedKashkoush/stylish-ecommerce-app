import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/widgets/scroll/list_scroll_bar.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/widgets/trending/trending_card.dart';

class TrendingList extends StatefulWidget {
  final List<ProductModel> products;
  const TrendingList({
    super.key,
    required this.products,
  });

  @override
  State<TrendingList> createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  final PageController _controller = PageController(viewportFraction: 0.46);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 186,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            padEnds: false,
            controller: _controller,
            itemBuilder: (_, index) => Padding(
              padding: EdgeInsetsDirectional.only(
                end: index < widget.products.length - 1 ? 8.0 : 0,
              ),
              child: TrendingCard(
                product: widget.products[index],
              ),
            ),
            itemCount: widget.products.length,
          ),
          ListScrollBar(
            controller: _controller,
            length: widget.products.length - 2,
            onNext: _next,
            onPrevious: _previous,
          ),
        ],
      ),
    );
  }

  void _next() {
    if (!_controller.hasClients) return;

    if (_controller.page?.ceil() == widget.products.length - 2) return;

    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previous() {
    if (!_controller.hasClients) return;

    if (_controller.page == 0) return;

    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
