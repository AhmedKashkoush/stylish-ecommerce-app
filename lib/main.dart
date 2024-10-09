import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stylish_ecommerce_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stylish_ecommerce_app/features/auth/model/repositories/auth_repository.dart';
import 'package:stylish_ecommerce_app/features/auth/view_model/auth_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(AuthRepository(FirebaseAuth.instance,GoogleSignIn(),FirebaseFirestore.instance)),)
      ],
      child: const StylishApp(),)

  );
}
