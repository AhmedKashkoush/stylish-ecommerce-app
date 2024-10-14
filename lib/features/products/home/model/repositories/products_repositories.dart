import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../services/firebase_storage_servise.dart';
import '../product.dart';

class ProductRepository {
  final FirebaseFirestore _firestore;

  ProductRepository( this._firestore);


  Future<List<Product>> fetchProductsForCategory(String categoryId) async {
    try {

      // Get the 'products' sub-collection for the category
      QuerySnapshot snapshot = await _firestore
          .collection('categories')
          .doc(categoryId) // Use the document ID (category ID)
          .collection('products')
          .get();
      // Fetch image URL for each product and convert each document to a Product object
      List<Product> products = [];

      for(var doc in snapshot.docs){
        Product product = Product.fromFirestore(doc);
        // Fetch the download URL for the product image from Firebase Storage
        print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
        print(product);
        String imageUrl = await FirebaseStorageService().getImageDownloadURL(product.image);


        // Replace the image path with the actual download URL
        product = Product(
          id: product.id,
          name: product.name,
          description: product.description,
          image: imageUrl, // Set the image to the download URL
          currency: product.currency,
          price: product.price,
          rate: product.rate,
          totalRate: product.totalRate,
          sale: product.sale,
        );
        products.add(product);
      }
      // Convert each document in the 'products' collection to a Product object
      return  products;
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

}
