import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/widgets/scroll/list_scroll_bar.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/widgets/deal_of_the_day/dod_card.dart';

class DodList extends StatefulWidget {
  final List<ProductModel> products;
  const DodList({super.key, required this.products});

  @override
  State<DodList> createState() => _DodListState();
}

class _DodListState extends State<DodList> {
  final PageController _controller = PageController(viewportFraction: 0.5);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 242,
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
              child: DodCard(
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

    if (_controller.page == widget.products.length - 2) return;

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
