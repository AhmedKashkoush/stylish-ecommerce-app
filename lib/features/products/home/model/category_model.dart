import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';

class CategoryModel {
  final String id; // Add this line
  final String name;
  String image;
  final List<ProductModel> products;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.products,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'products': products.map((p) => p.toJson()).toList(),
    };
  }

  // Factory constructor to create a Category from Firestore data
  factory CategoryModel.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;

    return CategoryModel(
      // Document ID
      id: doc.id, // Use document ID as category ID
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      products: [], // Initially an empty list; will be populated later by ProductsCubit
    );
  }
}