import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;




  Future<String> getDownloadURL2(String imagePath) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(imagePath);
      String downloadUrl = await ref.getDownloadURL();
      print('Image URL: $downloadUrl'); // Check if this is a valid URL
      return downloadUrl;
    } catch (e) {
      print('Error fetching download URL: $e');
      return '';
    }
  }
  Future<String> getDownloadURL(String imagePath) async {
    try {
      // Strip out the "gs://stylish-e-commerce-app.appspot.com/" part if it exists
      String filePath = imagePath.replaceFirst('gs://stylish-e-commerce-app.appspot.com/', '');


      final ref = FirebaseStorage.instance.ref().child(filePath);
      String downloadUrl = await ref.getDownloadURL();
      print("Oooooooooooooooooooooooooooo");
      print(filePath);
      return downloadUrl;
    } catch (e) {
      print('Error fetching download URL: $e');
      return '';
    }
  }



  Future<String> getImageDownloadURL(String gsPath) async {
    try {
      signInAnonymously();
      // Strip out the "gs://stylish-e-commerce-app.appspot.com/" part
      String filePath = gsPath.replaceFirst('gs://stylish-e-commerce-app.appspot.com/', '');

      // Log the final file path to ensure it’s correct
      print("File path: $filePath");

      // Create the Firebase Storage reference
      final ref = FirebaseStorage.instance.ref(filePath);

      // Log the reference to ensure it’s correct
      print("Firebase Storage reference: $ref");

      // Get the download URL
      String downloadUrl = await ref.getDownloadURL();

      // Log the download URL
      print("Download URL: $downloadUrl");

      return downloadUrl;
    } catch (e) {
      // Log the error with more details
      print('Error fetching download URL: $e');
      return '';
    }
  }


  Future<void> signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      print("User signed in anonymously");
    } catch (e) {
      print("Error signing in anonymously: $e");
    }
  }

}
