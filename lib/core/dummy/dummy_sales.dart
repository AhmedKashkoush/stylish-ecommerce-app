import 'package:stylish_ecommerce_app/features/products/home/model/sales_offer_model.dart';

const String _base = 'assets/images/dummy';

final List<SalesOfferModel> dummySales = List.generate(
  3,
  (index) => const SalesOfferModel(
    image: '$_base/offer.png',
    title: '50-40% OFF',
    description: 'Now in (product)\nAll colors',
  ),
); 
//   [
//   SalesOfferModel(
//     image: '$_base/offer.png',
//     title: '50-40% OFF',
//     description: 'Now in (product)\nAll colors',
//   ),
//   SalesOfferModel(
//     image: '$_base/offer.png',
//     title: '50-40% OFF',
//     description: 'Now in (product)\nAll colors',
//   ),
//   SalesOfferModel(
//     image: '$_base/offer.png',
//     title: '50-40% OFF',
//     description: 'Now in (product)\nAll colors',
//   ),
// ];
