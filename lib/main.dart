import 'package:flutter/material.dart';
import 'package:sampark/config/app_theme.dart';
import 'package:sampark/views/splash/splash_view.dart';
import 'package:sampark/views/welcome/welcome_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sampark',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: WelcomeView(),
    );
  }
}
