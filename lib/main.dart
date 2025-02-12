import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/config/app_theme.dart';
import 'package:sampark/config/routes/routes.dart';
import 'package:sampark/firebase_options.dart';
import 'package:sampark/views/auth/login/login_view.dart';
import 'package:sampark/views/auth/register/register_view.dart';
import 'package:sampark/views/contact/contact_view.dart';
import 'package:sampark/views/home/home_view.dart';
import 'package:sampark/views/profile/profile_view.dart';
import 'package:sampark/views/splash/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    await Supabase.initialize(
      url: "https://igncidcemhlwzgooafsv.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlnbmNpZGNlbWhsd3pnb29hZnN2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkzNDMwODQsImV4cCI6MjA1NDkxOTA4NH0.H91kXDJTDC2stv6lOO34WXLecbEwHz_J9Zd20tAG3WM",
    );

    print("Firebase initialized successfully");
    print("Supabase initialized successfully");
  } catch (e) {
    print("Initialization error: $e");
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
      home: SplashView(),
    );
  }
}
