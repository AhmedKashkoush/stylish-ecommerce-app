import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stylish_ecommerce_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stylish_ecommerce_app/features/auth/model/repositories/auth_repository.dart';
import 'package:stylish_ecommerce_app/features/auth/view_model/auth_cubit.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/repositories/category_repository.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/repositories/products_repositories.dart';
import 'package:stylish_ecommerce_app/features/products/home/view_model/category/category_cubit.dart';
import 'package:stylish_ecommerce_app/features/products/home/view_model/home/home_cubit.dart';
import 'package:stylish_ecommerce_app/features/products/home/view_model/product/product_cubit.dart';
import 'package:stylish_ecommerce_app/services/firebase_messaging_service.dart';

import 'firebase_options.dart';

// Store the notification in Hive
var notificationsBox = Hive.box('notifications');

// This function will handle background messages
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (message.notification != null) {
    // save notification in hive local database
    notificationsBox.add({
      'title': message.notification?.title ?? 'No Title',
      'body': message.notification?.body ?? 'No Body',
      'timestamp': DateTime.now().toString(),
    });

    // Show notification using Awesome Notifications
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 100897654, // Unique ID for this notification
        channelKey:
            'high_importance_channel', // Ensure this matches the initialized channelKey
        title: message.notification?.title,
        body: message.notification?.body,
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AwesomeNotifications().initialize(
    null, // Notification icon
    [
      NotificationChannel(
        channelKey: 'high_importance_channel',
        channelName: 'High Importance Notifications',
        channelDescription: 'This channel is for important notifications.',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      )
    ],
    debug: true,
  );

  // Initialize Firebase Messaging Service
  MyFirebaseMessagingService firebaseMessagingService =
      MyFirebaseMessagingService();
  await firebaseMessagingService.init(); // Call the init method

  // Handle foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      // Create a notification map to store it in Hive
      Map<String, dynamic> notification = {
        'title': message.notification?.title ?? 'No Title',
        'body': message.notification?.body ?? 'No Body',
        'timestamp': DateTime.now().toIso8601String(),
      };

      // Add the new notification to the box
      notificationsBox.add(notification);

      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10, // Notification ID
          channelKey: 'basic_channel',
          title: message.notification?.title,
          body: message.notification?.body,
          notificationLayout: NotificationLayout.Default,
        ),
      );
    }
  });

  // Set up the background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

  await Hive.initFlutter();

  // Open a box to store notifications
  await Hive.openBox('notifications');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Received message in foreground: ${message.notification?.title}');

    if (message.notification != null) {
      // Show notification using Awesome Notifications
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 100897654, // Unique ID for this notification
          channelKey:
              'basic_channel', // Ensure this matches the initialized channelKey
          title: message.notification?.title,
          body: message.notification?.body,
          notificationLayout: NotificationLayout.Default,
        ),
      );
    }
  });
  // final jsonString = await ProductService().loadJsonFromAsset();
  // final categories = ProductService().parseCategories(jsonString);
  // await ProductService().uploadCategoriesToFirestore(categories);

  // Initialize cubits
  final CategoryCubit categoryCubit =
      CategoryCubit(CategoryRepository(FirebaseFirestore.instance));
  final ProductCubit productCubit =
      ProductCubit(ProductRepository(FirebaseFirestore.instance));

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthCubit(AuthRepository(
            FirebaseAuth.instance, GoogleSignIn(), FirebaseFirestore.instance)),
      ),
      BlocProvider(create: (context) => categoryCubit),
      BlocProvider(create: (context) => productCubit),
      BlocProvider(
        create: (context) =>
            HomeCubit(categoryCubit: categoryCubit, productCubit: productCubit),
      )
    ],
    child: const StylishApp(),
  ));
}
