import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFailure{
  final String message ;

  AuthFailure(this.message);

}




class AuthResult{
   final Either<AuthFailure , User> result;
  AuthResult(this.result);
}