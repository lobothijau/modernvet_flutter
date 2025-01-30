import 'package:flutter/material.dart';
import 'package:modernvet/theme.dart';
import 'reviews.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Vet',
      theme: appTheme,
      home: const ReviewsScreen(),
    );
  }
}

