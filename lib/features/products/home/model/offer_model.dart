import 'package:stylish_ecommerce_app/features/products/home/model/product.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';

class OfferModel {
  final DateTime until;
  final List<Product> products;

  const OfferModel({required this.until, required this.products});

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      until: DateTime.parse(json['until']),
      products: (json['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'until': until.microsecondsSinceEpoch,
        'products': products.map((e) => e.toJson()).toList(),
      };
}
