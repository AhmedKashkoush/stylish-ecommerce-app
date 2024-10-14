import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final String image;
  final String currency;
  final double price;
  final double rate;
  final int totalRate;
  final double? sale; // Nullable, since not all products have sales.

  Product( {
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.currency,
    required this.price,
    required this.rate,
    required this.totalRate,
    this.sale,

  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'currency': currency,
      'price': price,
      'rate': rate,
      'totalRate': totalRate,
      'sale': sale,
    };
  }

  // Factory constructor to create a Product from Firestore data
  factory Product.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;

    return Product(

      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
      currency: data['currency'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      rate: (data['rate'] ?? 0).toDouble(),
      totalRate: data['totalRate'] ?? 0,
      sale: data['sale'], // Sale might be null
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, image: $image, currency: $currency, price: $price, rate: $rate, totalRate: $totalRate, sale: $sale}';
  } // Factory constructor to create a Product from a JSON map
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '', // Provide default empty string if id is null
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      currency: json['currency'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      rate: (json['rate'] ?? 0).toDouble(),
      totalRate: json['totalRate'] ?? 0,
      sale: (json['sale'] as num?)?.toDouble(), // Convert to double if present
    );
  }
}