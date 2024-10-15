import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../services/firebase_storage_servise.dart';
import '../category.dart';
import '../category_model.dart';

class CategoryRepository{

  final FirebaseFirestore _firestore;

  CategoryRepository(this._firestore);

  // Future<List<CategoryModel>> fetchCategories() async{
  //   try{
  //     QuerySnapshot querySnapshot = await _firestore.collection('categories').get();
  //
  //     // Map each document to a CategoryModel
  //     List<CategoryModel> categories = querySnapshot.docs.map((doc) {
  //       return CategoryModel.fromJson(doc.data() as Map<String, dynamic>);
  //     }).toList();
  //
  //     return categories;
  //
  //   } catch (e) {
  //   throw Exception('Error fetching categories: $e');
  //   }
  // }

  // Future<List<Category>> fetchCategories() async {
  //   try {
  //     QuerySnapshot snapshot = await _firestore.collection('categories').get();
  //     return snapshot.docs.map((doc) => Category.fromFirestore(doc)).toList();
  //   } catch (e) {
  //     throw Exception('Error fetching categories: $e');
  //   }
  // }


  Future<List<Category>> fetchCategories() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('categories').get();
      List<Category> categories = [];

      for (var doc in snapshot.docs) {
        // Get the image path from the document
        String imagePath = doc['image'];

        String imageUrl = await FirebaseStorageService().getDownloadURL(imagePath);


        // Create Category object
        categories.add(Category.fromFirestore(doc)..image = imageUrl);
      }
      print("lllllllllllllllllllllllllllllllllllll");
      print(categories.first.name);
      return categories;
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }

}