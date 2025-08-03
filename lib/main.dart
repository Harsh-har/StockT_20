import 'package:flutter/material.dart';
import 'Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stock T20",
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SplashScreen(),  // ✅ first screen
    );
  }
}
