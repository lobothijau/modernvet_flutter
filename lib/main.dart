import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:modernvet/theme.dart';
import 'screens/reviews_screen.dart';
import 'providers/review_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewProvider(),
      child: MaterialApp(
        title: 'Modern Vet',
        theme: appTheme,
        home: const ReviewsScreen(),
      ),
    );
  }
}

