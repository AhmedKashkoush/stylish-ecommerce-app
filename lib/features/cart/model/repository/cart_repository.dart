import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  CartRepository();

  Future<void> addToCart(String productId, String productName, double price, String imageUrl) async {
    final userId =  FirebaseAuth.instance.currentUser!.uid;
    final cartRef = _firestore.collection('users').doc(userId);

    // Get the current user's cart
    final userDoc = await cartRef.get();
    if (userDoc.exists) {
      List<dynamic> cart = userDoc.data()?['cart'] ?? [];

      // Check if product already in cart, if so update quantity
      bool productExists = false;
      for (var item in cart) {
        if (item['id'] == productId) {
          item['quantity'] += 1;
          productExists = true;
          break;
        }
      }

      if (!productExists) {
        cart.add({
          'id': productId,
          'name': productName,
          'quantity': 1,
          'price': price,
          'image': imageUrl, // Adding the image attribute
        });
      }

      // Update the cart in Firebase
      await cartRef.update({'cart': cart});
    } else {
      // If user document doesn't exist, create it with the cart
      await cartRef.set({
        'email': 'user@example.com', // Replace with actual user email
        'cart': [
          {
            'id': productId,
            'name': productName,
            'quantity': 1,
            'price': price,
            'image': imageUrl, // Adding the image attribute
          }
        ],
      });
    }
  }

  Future<List<dynamic>> loadCartItems() async {
    final userId =  FirebaseAuth.instance.currentUser!.uid;
    final cartRef = _firestore.collection('users').doc(userId);
    final userDoc = await cartRef.get();

    if (userDoc.exists) {
      return userDoc.data()?['cart'] ?? [];
    }
    return [];
  }
}
