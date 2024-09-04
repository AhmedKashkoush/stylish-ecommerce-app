import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/home/model/product_model.dart';
import 'package:stylish_ecommerce_app/features/home/view/widgets/deal_of_the_day/dod_card.dart';

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
      height: 300,
      child: Stack(
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
        ],
      ),
    );
  }

  void _next() {
    if (!_controller.hasClients) return;

    if (_controller.page == widget.products.length - 1) return;

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
