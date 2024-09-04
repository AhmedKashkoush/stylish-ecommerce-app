import 'package:stylish_ecommerce_app/features/home/model/product_model.dart';

class DodModel {
  final DateTime until;
  final List<ProductModel> products;

  const DodModel({required this.until, required this.products});

  factory DodModel.fromJson(Map<String, dynamic> json) {
    return DodModel(
      until: DateTime.parse(json['until']),
      products: (json['products'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'until': until.microsecondsSinceEpoch,
        'products': products.map((e) => e.toJson()).toList(),
      };
}
