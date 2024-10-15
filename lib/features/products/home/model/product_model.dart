import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id, name, description, image, currency, category;
  final double price, rate;
  final int totalRate;
  final double? sale;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.currency,
    required this.category,
    required this.price,
    required this.rate,
    required this.totalRate,
    this.sale,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      currency: json['currency'],
      category: json['category'],
      price: json['price'],
      rate: json['rate'],
      totalRate: json['totalRate'],
      sale: json['sale'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'currency': currency,
        'category': category,
        'price': price,
        'rate': rate,
        'totalRate': totalRate,
        'sale': sale,
      };

  // Factory constructor to create a Product from Firestore data
  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;

    return ProductModel(

      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
      currency: data['currency'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      rate: (data['rate'] ?? 0).toDouble(),
      totalRate: data['totalRate'] ?? 0,
      sale: data['sale'],
      category: data['category']??" ", // Sale might be null
    );
  }
}
