import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/config/app_theme.dart';
import 'package:sampark/config/routes/routes.dart';
import 'package:sampark/firebase_options.dart';
import 'package:sampark/views/auth/login/login_view.dart';
import 'package:sampark/views/auth/register/register_view.dart';
import 'package:sampark/views/home/home_view.dart';
import 'package:sampark/views/profile/profile_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase initialized successfully");
  } catch (e) {
    print("Firebase initialization error: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sampark',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      getPages: Routes.views,
      home: ProfileView(),
    );
  }
}
