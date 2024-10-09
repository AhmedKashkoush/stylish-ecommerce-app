import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:stylish_ecommerce_app/features/auth/model/auth_result.dart';

import '../model/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());




  Future<void> forgotPassword(String email)async{
    emit(ForgotPasswordLoading());
   final Either<String , void> result  = await authRepository.forgotPassword(email);
   result.fold(
   (l) => emit(ForgotPasswordError(l)),
   (r) {
     emit(const ForgotPasswordSuccess("you are successfully updated your password"));
   },);
  }

  Future<void> signUp(String email, String password) async{
    emit(SignUpLoading());
   final AuthResult result = await authRepository.signUp(email, password);
   result.result.fold(
         (l) =>emit( SignUpError(l.message)) , 
         (r) =>emit(SignUpSuccess(r)) ,);
  }
  
  Future<void> signIn(String email, String password) async{
    emit(SignInLoading());
    
    final AuthResult result =await authRepository.signIn(email, password);
    emit(SignInLoading());
    result.result.fold(
          (l) =>emit(SignInError(l.message)) ,
          (r) =>emit(SignInSuccess(r)) ,);
  }

  // Sign In with Google
  Future<void> signInWithGoogle() async {
    emit(SignInWithGoogleLoading());
    try {
      final user = await authRepository.signInWithGoogle();
      emit(SignInWithGoogleSuccess(user!));
    } catch (e) {
      emit(SignInWithGoogleError('Google Sign In failed: ${e.toString()}'));
    }
  }

  // Sign Out
  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await authRepository.signOut();
      emit(SignOutSuccess());  // After signing out, return to initial state
    } catch (e) {
      emit(SignOutError('Sign Out failed: ${e.toString()}'));
    }
  }


}
