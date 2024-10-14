
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../features/products/home/model/category.dart';
import '../features/products/home/model/product.dart';

 // Adjust the import path as necessary

class ProductService {

  // Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  // Function to load JSON from assets
  Future<void> uploadProductsToFiresStore() async {
    // Load the products.json file from the assets folder
    String jsonString = await rootBundle.loadString('assets/products.json');

    // Decode the JSON file to a list of products
    List<dynamic> products = json.decode(jsonString);

    // Loop through the products and upload each one to Firestore
    for (var product in products) {
      await firestore
          .collection('categories')
          .doc(product['category']) // Assuming you want to add products under category
          .collection('products')
          .add({
        'name': product['name'],
        'description': product['description'],
        'image': product['image'],
        'currency': product['currency'],
        'price': product['price'],
        'rate': product['rate'],
        'totalRate': product['totalRate'],
        'sale': product['sale'] ?? 0.0, // Sale is optional
      });
    }
  }

  List<Category> parseCategories(String jsonString) {
    final data = json.decode(jsonString) as List<dynamic>;
    return data.map((categoryJson) {
      final products = (categoryJson['products'] as List<dynamic>).map((productJson) {
        return Product(
          name: productJson['name'],
          description: productJson['description'],
          image: productJson['image'],
          currency: productJson['currency'],
          price: productJson['price'].toDouble(),
          rate: productJson['rate'].toDouble(),
          totalRate: productJson['totalRate'],
          sale: productJson['sale']?.toDouble(),
          id: productJson['id'],
        );
      }).toList();

      return Category(
        id:categoryJson['id'],
        name: categoryJson['name'],
        image: categoryJson['image'],
        products: products,
      );
    }).toList();
  }

  Future<void> uploadCategoriesToFirestore(List<Category> categories) async {
    final firestore = FirebaseFirestore.instance;

    for (final category in categories) {
      final categoryRef = firestore.collection('categories').doc(category.name);
      await categoryRef.set({
        'name': category.name,
        'image': category.image,
      });

      for (final product in category.products) {
        await categoryRef.collection('products').add(product.toJson());
      }
    }
  }


  Future<String> loadJsonFromAsset() async {
    return await rootBundle.loadString('assets/products.json');
  }


}