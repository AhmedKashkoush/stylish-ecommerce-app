import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/widgets/buttons/list_scroll_button.dart';
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
  final ValueNotifier<bool> _hasNextNotifier = ValueNotifier<bool>(true),
      _hasPreviousNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    _controller.addListener(_pageListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                  valueListenable: _hasPreviousNotifier,
                  builder: (_, hasPrevious, __) {
                    if (!hasPrevious) return const SizedBox.shrink();
                    return ListScrollButton(
                      iconType: ListScrollButtonIconType.previous,
                      onTap: _previous,
                    );
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: _hasNextNotifier,
                  builder: (_, hasNext, __) {
                    if (!hasNext) return const SizedBox.shrink();
                    return ListScrollButton(
                      iconType: ListScrollButtonIconType.next,
                      onTap: _next,
                    );
                  },
                ),
              ],
            ),
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

  void _pageListener() {
    if (!_controller.hasClients) return;

    _hasNextNotifier.value = _controller.page! < widget.products.length - 2;
    _hasPreviousNotifier.value = _controller.page! > 0;
  }
}
