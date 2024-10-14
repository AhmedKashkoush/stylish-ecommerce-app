import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../auth_result.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth ;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  AuthRepository(this.firebaseAuth, this._googleSignIn, this._firestore);

// sign up method
  Future<AuthResult> signUp(String email, String password) async {
    try{
    final  UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    if (userCredential.user != null) {
      // Save user data in Firestore
      await saveUserData(userCredential.user!);
    }

    return AuthResult(Right(userCredential.user!));
    }
    catch(e){
      return AuthResult(Left(AuthFailure("Failed to sign in: ${e.toString()}")));
    }

  }

// sign in method

  Future<AuthResult> signIn(String email, String password) async {
    try{
    final UserCredential userCredential =  await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);



    return AuthResult(Right(userCredential.user!));
    }
    catch(e){
      return AuthResult(Left(AuthFailure("Failed to sign up: ${e.toString()}")));
    }
  }

// sign in with google
  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception("Google Sign In cancelled");
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final result = await firebaseAuth.signInWithCredential(credential);
      if (result.user != null) {
        // Save user data in Firestore
        await saveUserData(result.user!);
        
      }
      return result.user;
    } catch (e) {
      throw Exception('Error signing in with Google: $e');
    }
  }


  // forgot password method
  Future<Either<String , void>> forgotPassword(String email )async{
  try{
    await  firebaseAuth.sendPasswordResetEmail(email: email);
    return const Right(null);
  }
  on FirebaseAuthException catch (e) {

    return Left(e.message ?? 'An unknown error occurred');
  }
  catch(e){
    return Left("An error occurred: $e");
  }
  }


// save user data in firestore
  Future<void> saveUserData(User user) async {
    try {
      // Create or update user document in 'users' collection
      await _firestore.collection('users').doc(user.uid).set({
        'email': user.email,
        'wishlist': [],
        'cart': [],
      }, SetOptions(merge: true));  // Use merge to prevent overwriting if the doc exists
    } catch (e) {
      print('Error saving user data: $e');
      throw e;
    }
  }


  // Sign out (works for both Google and email/password users)
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      throw Exception('Error signing out: $e');
    }
  }
  // get current user
  User? getCurrentUser(){
   return  firebaseAuth.currentUser;
 }
}
