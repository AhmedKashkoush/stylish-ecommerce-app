import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish_ecommerce_app/core/constants/colors.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_sales.dart';
import 'package:stylish_ecommerce_app/core/extensions/space_extension.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/sales_offer_model.dart';
import 'package:stylish_ecommerce_app/features/products/home/view/widgets/sales_offer_card.dart';

class SalesSection extends StatefulWidget {
  final List<SalesOfferModel> offers;
  const SalesSection({
    Key? key,
    required this.offers,
  }) : super(key: key);

  @override
  State<SalesSection> createState() => _SalesSectionState();
}

class _SalesSectionState extends State<SalesSection> {
  final ValueNotifier<int> _pageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          key: const PageStorageKey<String>('sales'),
          items: widget.offers
              .map(
                (offer) => SalesOfferCard(
                  offer: offer,
                  onButtonTap: () {},
                ),
              )
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            aspectRatio: 21 / 9,
            onPageChanged: _onPageChanged,
          ),
        ),
        10.height,
        ValueListenableBuilder(
            valueListenable: _pageNotifier,
            builder: (context, value, _) {
              return AnimatedSmoothIndicator(
                activeIndex: value,
                count: dummySales.length,
                effect: ScaleEffect(
                  activeDotColor: AppColors.primary.withOpacity(0.7),
                  dotColor: context.theme.iconTheme.color!.withOpacity(0.1),
                  dotHeight: 8,
                  dotWidth: 8,
                  scale: 1.2,
                ),
              );
            }),
      ],
    );
  }

  void _onPageChanged(int index, CarouselPageChangedReason reason) {
    _pageNotifier.value = index;
  }
}
